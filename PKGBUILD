# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.26.sdk814
_runtimever=2.1.26
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/5d5de5cd-5a86-41fb-ba6d-9672f25ffbe4/cd3ec8bb9f8e600249705d078c46418e/aspnetcore-runtime-2.1.26-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/29ba76e1-db96-4cbb-8964-0a6c859712c4/d6e56c1dacf78b6846464a77dda4115d/aspnetcore-runtime-2.1.26-linux-x64.tar.gz')
sha512sums_armv7h=('3c3d7ea699fda97b28557522ca68a214650952a92642c094925602125c5515da5e74597c79509378eb467b94354c84e2e8d0b89c48b59a9cd5838a55f7442959')
sha512sums_x86_64=('c3d12b53e5658902d49aae7f4457e785be09859eeb0270b9614f95021f7387f94f78a4d3c72c7cc62a5eefe096fc19c1256439e66676723f8fd2451c70dbb0de')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
