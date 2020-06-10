# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.19.sdk807
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/4e8cd01e-9b3d-4e69-837d-f8d558fb1a9f/e1c52cf207aee58ae4aff32d09ecfe05/aspnetcore-runtime-2.1.19-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/abf8cad9-fe36-4bb6-9cdb-926a50bf63c6/5dc2f4e3e133ef073f12340d4fd6e943/aspnetcore-runtime-2.1.19-linux-x64.tar.gz')
sha512sums_armv7h=('f8ec53beb23c1308d91ffb2931c804714a0a10553319ffa596cd47d00cf324207130397f90ab5b78dc3d4f408eefd6753221254abaf0d02ffca9522b85851892')
sha512sums_x86_64=('4ca81b0dc1efcb8562a07f658461ce5caf976c93942af7549053f4f5c3da232964989fee2ea42537c1086b244950d8e6a1230d3486317af5108d203036c4bc0c')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
