# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=('aspnet-runtime-2.1')
pkgver=2.1.23.sdk811
_runtimever=2.1.23
pkgrel=1
pkgdesc='The ASP.NET Core runtime binary version 2.1' 
arch=('x86_64' 'armv7h')
url='https://www.microsoft.com/net/core'
license=('MIT')
options=('staticlibs')
depends=('dotnet-runtime-2.1')
provides=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
conflicts=("aspnet-runtime-2.1" "aspnet-runtime=${_runtimever}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/73592379-5553-461d-9472-f54688488955/74bc7c5a34487da9447b9544679566c1/aspnetcore-runtime-2.1.23-linux-arm.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/3422a123-3f37-4544-b0ed-e3922b50e1b0/c34c607ba18a67763bacded434607c56/aspnetcore-runtime-2.1.23-linux-x64.tar.gz')
sha512sums_armv7h=('0855087a9855c4809d19fc351fbe717a6aede8c048cdb47443e8a516722b5411b0fad12caa2524d6fa803292783bc8c1dc4c09a2bd9becc61c0df33819364f27')
sha512sums_x86_64=('47df15608671ace7a13f7ba03d74a34fa8b396344409cb2cc4daeafdda8b22dc7309dd60b1f469aadeb89cfc0e22b7b9aebde3ffeaedad431ad4f4f51296030d')

package() {
  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-2.1 "${pkgdir}"/usr/share/licenses/aspnet-runtime-2.1
}
