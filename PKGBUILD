# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=dotnet-sdk-bin
pkgver=3.0.101
pkgrel=1
pkgdesc='The .NET Core SDK (binary version)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://dotnet.microsoft.com/download/dotnet-core'
license=('MIT')
depends=('dotnet-runtime=3.0.1')
optdepends=('aspnet-runtime=3.0.1: ASP.NET build support')
options=('staticlibs')
provides=("dotnet-sdk=${pkgver%+*}")
source_armv7h=('https://download.visualstudio.microsoft.com/download/pr/0b30374c-3d52-45ad-b4e5-9a39d0bf5bf0/deb17f7b32968b3a2186650711456152/dotnet-sdk-3.0.101-linux-arm.tar.gz')
source_aarch64=('https://download.visualstudio.microsoft.com/download/pr/89fb60b1-3359-414e-94cf-359f57f37c7c/256e6dac8f44f9bad01f23f9a27b01ee/dotnet-sdk-3.0.101-linux-arm64.tar.gz')
source_x86_64=('https://download.visualstudio.microsoft.com/download/pr/4f51cfd8-311d-43fe-a887-c80b40358cfd/440d10dc2091b8d0f1a12b7124034e49/dotnet-sdk-3.0.101-linux-x64.tar.gz')
sha512sums_armv7h=('79f1a40e30b1e3f1e743dc7e9d539ec296a65ba9a2ca5a11c7ba0d3811ddfda5a4897c263da754d6f5ee4d02531d5a42cc303f1106c57d84bbe8d7d713c510bc')
sha512sums_aarm64=('e0c148a515d74325e110b4542c87c6397ec78efd362ef7ca49b31768476d7f174456895a5054159492bd949caf0cdfc466c703855d666bb337a89cae381188ac')
sha512sums_x86_64=('8cd6070c9df1272ac3f2a0e9bd8c1fc2cfef38907fa2e3c81384f005168f45036b5904b4f731cbe37d2b3fe558f560008c481939093b0d08ef0f1778ca97f186')

package() {
  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  cp -dr --no-preserve='ownership' packs sdk templates "${pkgdir}"/opt/dotnet/
  ln -s dotnet-host-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-bin
}
