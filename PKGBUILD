# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.15.sdk803
pkgrel=1
pkgdesc='The ASP.NET Core runtime version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'lldb' 'llvm' 'lttng-ust' )
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/125a3a2f-fd71-4b95-bf18-084356595eca/d48ffcd3bdf63cbb52d47b81781f930f/aspnetcore-runtime-2.1.15-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/3a4fa17f-1c69-497c-b04d-b2d323b58f17/0994ea07591e8592f95f6057f5a68bdc/aspnetcore-runtime-2.1.15-linux-x64.tar.gz')
sha512sums_armv7h=('ea9b2e9908460c4e07bbdd530368c06f2e712b7f3ed16b5364723070636d64846de56367e94d52d28548ad316e875a591e389295ae78ca84ae9a80cdea391bdb')
sha512sums_x86_64=('a557f175cca92bb1dd66cf638ff84fe85750fab67028bd4472748b22ef0591f5f3812446a3dbe21c3d1be28c47d459d854d690dbace1b95bc7136b248af87334')

package() {
  arch=('x86_64' 'armv7h')
  pkgdesc='The ASP.NET Core runtime version 2.1'
  depends=('dotnet-runtime-2.1')
  provides=("aspnet-runtime-2.1")
  conflicts=("aspnet-runtime-2.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
