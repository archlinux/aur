# Maintainer: Max Liebkies <mail at maxliebkies dot de>

pkgname=dotnet-sdk-2.0
pkgver=2.0.0_preview2_006497
pkgrel=1
pkgdesc="A command line utility for building, testing, packaging and running .NET Core applications and libraries"
arch=(x86_64)
url="https://www.microsoft.com/net/core"
license=('MIT')
depends=('dotnet-runtime-2.0')
options=('staticlibs')

conflicts=('dotnet-sdk')

source=("https://download.microsoft.com/download/F/A/A/FAAE9280-F410-458E-8819-279C5A68EDCF/dotnet-sdk-2.0.0-preview2-006497-linux-x64.tar.gz")

sha256sums=('f70b6dfc4e46230001ef863b54992b32bb04c998b098ad58dd47152f348a0997')

package() {
  mkdir -p "${pkgdir}/opt/dotnet/sdk/"

  cp --force --preserve=mode --recursive "${srcdir}/sdk/${pkgver//_/-}" "${pkgdir}/opt/dotnet/sdk/${pkgver//_/-}"

  chown -R root:root "${pkgdir}/opt/dotnet"
  find "${pkgdir}/opt/dotnet" -name *.dll -exec chmod 644 {} \;
  find "${pkgdir}/opt/dotnet" -name *.exe -exec chmod 755 {} \;
  find "${pkgdir}/opt/dotnet" -name *.so -exec chmod 755 {} \;
}

# vim:set ts=2 sw=2 et:
