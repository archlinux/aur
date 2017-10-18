# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk-2.0
pkgver=2.0.2
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

source=("https://download.microsoft.com/download/7/3/A/73A3E4DC-F019-47D1-9951-0453676E059B/dotnet-sdk-2.0.2-linux-x64.tar.gz")

sha256sums=('2a9e0ed251a7f98a46473f694532acdc5a0960d32204e82315c38c1b29fdd317')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/sdk/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/${pkgver//_/-}" "${pkgdir}/opt/dotnet/sdk/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
