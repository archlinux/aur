# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.17.sdk805
pkgrel=2
pkgdesc='The ASP.NET Core runtime version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'lldb' 'llvm' 'lttng-ust' )
options=('staticlibs')
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/1a3c3183-ea43-4060-9205-09151a6ab9d7/6f15f282afcd70fffd8b9e12de4cd8b9/aspnetcore-runtime-2.1.17-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/8074db1d-516d-44c9-abf5-5efe38752226/c809c044b639ce439d227c377dec2355/aspnetcore-runtime-2.1.17-linux-x64.tar.gz')
sha512sums_armv7h=('945a3de10e36f356acb6f6c84534e88ec49fcb6636e0351467aa1a449e79f4e3bf9fb1bfba7ed278fdd92d31c51ae6c638f0a7511fdbf42d29bd1f92903bd87b')
sha512sums_x86_64=('92ac51b814357cf1e8050cdd3803a7efad2147b7f0a4a97ce2aee34fcd02ca0b1c97f9f47b57b3b798e047b1947ea522fdd698842a1c020dcc05f759093639f1')

package() {
  arch=('x86_64' 'armv7h')
  pkgdesc='The ASP.NET Core runtime version 2.1'
  depends=('dotnet-runtime-2.1')
  provides=("aspnet-runtime-2.1" "aspnet-runtime=${pkgver}")
  conflicts=("aspnet-runtime-2.1")

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
