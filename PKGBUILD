# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.18.sdk806
pkgrel=2
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/3170bb79-e8b5-4f19-921e-618c16d5671a/085344b0aaea8c6a1cb15818af1b6328/aspnetcore-runtime-2.1.18-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/5e23ff62-5ddd-4fc5-9f72-e4250110cf58/956138123fcefedca324b0fea6c23d15/aspnetcore-runtime-2.1.18-linux-x64.tar.gz')
sha512sums_armv7h=('406119603dca8af68d9d91f1f622526ab6e43f13e2c630906bef92072bd73fc98207e93a1448f00a7df4b3e93f9e600b7ee43d6512285f0ab6147d83e3169d6f')
sha512sums_x86_64=('83d58102ba9d9b9a6f4f19ea799fd20939ff013b3d2e3348e363f41f30c1e902995f59538f9b04d8b671b310598206736ce7dd0acde51ce3847beb3262293d60')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
