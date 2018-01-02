# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk-2.0
pkgver=2.1.3
pkgrel=1
epoch=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime>=2.0.4')
options=('staticlibs')
install=dotnet-sdk-2.0.install

conflicts=('dotnet-sdk')

source=("https://download.microsoft.com/download/2/9/3/293BC432-348C-4D1C-B628-5AC8AB7FA162/dotnet-sdk-2.1.3-linux-x64.tar.gz")

sha256sums=('e6432b824395d88a69b77cc50427f2b5a41d44964c377125c53f02783aaa5005')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/sdk/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/${pkgver//_/-}" "${pkgdir}/opt/dotnet/sdk/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
