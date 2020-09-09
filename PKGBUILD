# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.22.sdk810
_runtimever=2.1.22
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/fe553baf-887f-4068-b7c8-6c37d93f5b39/e80ed0ad34dcc1281f4773cd3a38f821/aspnetcore-runtime-2.1.22-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/c1798274-4f4e-4e5b-8337-cb477add793c/2ab1c7f92fe497e07304b0b25c5f7845/aspnetcore-runtime-2.1.22-linux-x64.tar.gz')
sha512sums_armv7h=('46d6ddd819a811b2f192cbb7d2d8095e3647c6de8592d600024cec04ddb93fce068baa6727b3f1b8e4f313fac33ff854285b76e9e3657ec02f68c4abb8a38b13')
sha512sums_x86_64=('34a424a79fa91f76fd2f91c9104104b65239192d9f5167bc1647b8888c103fe6fde3786f12dac275d8da6a7ce3d8de8d56531c0bdbc42d9f9265ed6bc9a8b18f')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
