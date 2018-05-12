# Maintainer: Thomas Guillemard <me[at]thog[dot]eu>

pkgname=dotnet-sdk-rc
pkgver=2.1.300
pkgrel=1
pkgdesc='The .NET Core SDK'
arch=('x86_64')
url='https://www.microsoft.com/net/core'
license=('MIT')
depends=('dotnet-runtime-rc')
options=('staticlibs')
conflicts=('dotnet-sdk-2.0' 'dotnet-sdk')
provides=('dotnet-sdk-2.0' 'dotnet-sdk')
source=('https://download.microsoft.com/download/B/1/9/B19A2F87-F00F-420C-B4B9-A0BA4403F754/dotnet-sdk-2.1.300-rc1-008673-linux-x64.tar.gz')
sha256sums=('fa2a4c6336ab5134668b4a62e499b2a0c838caa342837780886d66937ebaeb2b')

package() {
  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' sdk "${pkgdir}"/opt/dotnet/
  ln -s dotnet-runtime "${pkgdir}"/usr/share/licenses/dotnet-sdk
}
