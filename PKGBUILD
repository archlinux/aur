# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.28.sdk816
_runtimever=2.1.28
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/fbdb615e-48c3-4646-9b90-76a5a15b4562/cc878beda4838f0cf7155c12036cc511/aspnetcore-runtime-2.1.28-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/66483281-5453-4504-9686-f72d1fd357f7/0de98386ca1709bde2b5f2f7df4c80da/aspnetcore-runtime-2.1.28-linux-x64.tar.gz')
sha512sums_armv7h=('66495834ffd457bb1b75edb2e8f238250812db23d0d0fccaf8a9d3a55ef5d666cd3a84dc46803b14e1595a71a6c5dea5a8c6532b89860f0d2136f28f14c3dc94')
sha512sums_x86_64=('d97bcd5a3e6986025c24deb95483dc556dcf806f2b2274a520b1bbebe5302954f2ce7e2997da600b29142622a6ff8b7ed6439afbadba7b32b472095216a54b12')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
