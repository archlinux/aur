# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk-2.0
pkgver=2.0.0
pkgrel=1
epoch=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime-2.0')
options=('staticlibs')
install=dotnet-sdk-2.0.install

conflicts=('dotnet-sdk')

source=("https://download.microsoft.com/download/1/B/4/1B4DE605-8378-47A5-B01B-2C79D6C55519/dotnet-sdk-2.0.0-linux-x64.tar.gz")

sha256sums=('6059a6f72fb7aa6205ef4b52583e9c041fd128e768870a0fc4a33ed84c98ca6b')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/sdk/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/${pkgver//_/-}" "${pkgdir}/opt/dotnet/sdk/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
