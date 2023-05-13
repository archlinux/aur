# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=amdgpu_top
pkgname=$_pkgname-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
arch=('x86_64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
depends=('libdrm')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}_amd64.deb")
sha256sums=('f80be05ad93002640ff223201921b61793a0c51b8d8607f44ac94e7fee1063ef')

package() {
  tar Jxpf data.tar.xz
  cd usr
  install -Dm644 share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 share/doc/amdgpu-top/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm755 bin/$_pkgname -t "${pkgdir}/usr/bin"
}
