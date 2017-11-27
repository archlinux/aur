# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk-2.0
pkgver=2.0.3
pkgrel=1
epoch=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime>=2.0')
options=('staticlibs')
install=dotnet-sdk-2.0.install

conflicts=('dotnet-sdk')

source=("https://download.microsoft.com/download/D/7/2/D725E47F-A4F1-4285-8935-A91AE2FCC06A/dotnet-sdk-2.0.3-linux-x64.tar.gz")

sha256sums=('6c4223094b1e3e93a466c6d91d3aa1053a3b2aef99b63bf45023bda3fca1aede')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/sdk/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/${pkgver//_/-}" "${pkgdir}/opt/dotnet/sdk/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
