# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.30.sdk818
_runtimever=2.1.30
pkgrel=2
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/45d40fc8-6d2d-45bf-95f5-85b04dddb2f9/15684494c511eb7d807cca09009c775f/aspnetcore-runtime-2.1.30-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/d6040f80-8343-4771-9c02-dbc9a35ac88a/68e74e6e46cf36fa1a50f68af6831d6d/aspnetcore-runtime-2.1.30-linux-x64.tar.gz')
sha512sums_armv7h=('a696a868955ef7bf31c830382e646e8c07040abfe50b49da345f22fa8b45576673aee36a0d4a836dbb987f138b19f856e979b0e5dab8f05c04feced0031a3b46')
sha512sums_x86_64=('60f65e2e37bb9af54f809ef0f4fe814c4c0dd9c969dea1aa81e94c0dc2433c5011cde39118196310ffac4e248b24924a2c154534194e70a8cdae40dfc81fe3d1')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.All "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
