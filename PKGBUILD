# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=amdgpu_top
pkgname=$_pkgname-bin
pkgver=0.1.11
pkgrel=2
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
arch=('x86_64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
depends=('libdrm')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}_amd64.deb")
sha256sums=('653e262f38949ab4c9435a64033bc100df058fd9b05be964ed5b33f75ff11043')

package() {
  tar Jxpf data.tar.xz
  cd usr
  install -Dm644 share/doc/amdgpu-top/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 share/man/man1/$_pkgname.1.gz -t "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -Dm644 share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
}
