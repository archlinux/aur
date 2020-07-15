# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.20.sdk808
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/292e38b1-bab5-4b15-8659-dfe8e3d6841b/2ca074694939aa06709070ffa91fad53/aspnetcore-runtime-2.1.20-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/f71a9aa8-b3f4-4afd-8200-3baf39a88b6b/4f91b8b5df2117ba35acf008c88f89e3/aspnetcore-runtime-2.1.20-linux-x64.tar.gz')
sha512sums_armv7h=('21c0f34031926b642d1ee31e91253d41673306682866f4aa452a802292df425056311fe315bec2f0681a92d71cf5f799f2f17b29994c1299660b8add78dab68e')
sha512sums_x86_64=('bbde6d45641aea8fd0345dd23a4da0cdc1609c65b372bfce9bb00fd7dbd4d0934c9325a1ffae87d88e43d474d52a7a077a6dc23f861feb8aaf02f834f42b31bd')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
