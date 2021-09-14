# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.2')
pkgver=2.2.8.sdk207
pkgrel=2
pkgdesc='The ASP.NET Core runtime binary version 2.2 (End of Life)' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.2')
provides=("aspnet-runtime-2.2" "aspnet-runtime=${pkgver}")
conflicts=("aspnet-runtime-2.2" "aspnet-runtime=${pkgver}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/9fcb0171-11d7-40e6-a2e8-2357813bf6bd/becdd52523d5a6782ded8febd2c487a0/aspnetcore-runtime-2.2.8-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e716faa4-345c-45a7-bd1f-860cdf422b75/fa8e57167f3bd4bf20b8b60992cf184f/aspnetcore-runtime-2.2.8-linux-x64.tar.gz')
sha512sums_armv7h=('fab9a1d9d101716337bb153af2ac36429fc387230c0c0bf2d639b31fb7f787bc8dbaaa31f28f9cbe69f117ffc78d8ddb5a5968da0e77785d3c12c6814ef50f7b')
sha512sums_x86_64=('954072376698be69acb7e277df2c243f931e10529def21dcbf9ce277609b30d462126bf8b8b3cab36476bec3d63a927b8e44e59e4d4cade23eef45956fba1ffd')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.All "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.2
}
