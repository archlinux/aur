# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.24.sdk812
_runtimever=2.1.24
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/89b79b5c-5f07-4512-aa77-cebf1d98c35a/e968517ab3cbfc534c54879d1e40b30b/aspnetcore-runtime-2.1.24-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/e91b0359-e19a-4d8d-9034-135312eec3e6/65ffbc85a45cbbd355c033b52bf4234d/aspnetcore-runtime-2.1.24-linux-x64.tar.gz')
sha512sums_armv7h=('c12921d6fefc778d0f824491e6d63d7dc330897fd6275b0b993771f77d7eaed0ec9c50dbf01a4803a54ae6c952018ef6f7a01928becd977d9add9ed23a3ea8fd')
sha512sums_x86_64=('e4b3a1e848d0cdec720946ff46fa1f31016f67f895bceab8ea19ce4c313284b636a6abd0378fb65cb02de3d9355a2663a382335e2e804694bd3ae3123032ddd7')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
