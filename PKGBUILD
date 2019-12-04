# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.14
pkgrel=1
pkgdesc='The ASP.NET Core runtime version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'lldb' 'llvm' 'lttng-ust' )
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/9c563df7-736b-49ce-bd17-e739f3765541/e93dd1eff909e59a7ba72784a64dc031/aspnetcore-runtime-2.1.14-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/22e9f27e-12cd-4ba9-86ce-113cbe7c55c2/a1097e49b4da2c1949919e752264f691/aspnetcore-runtime-2.1.14-linux-x64.tar.gz')
sha512sums_armv7h=('f4500187bf135254a03b5eb4105b8ce20f71d71e0f08c2c2ec914920f80435b7b36351c3f9c15504d0b1c2187b904c8283db67a2b60ebff374b058641153aaac')
sha512sums_x86_64=('85728bd9701a6db5743c495aaf87c859b697300b668afc01d0edd3814ce50929219c5a70745ee8bd9b2c478613cbba323c5e5834c7c5f0af792712f8070df763')

package() {
  arch=('x86_64' 'armv7h')
  pkgdesc='The ASP.NET Core runtime version 2.1'
  depends=('dotnet-runtime=2.1.14')
  provides=("aspnet-runtime=${pkgver%+*}")

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
