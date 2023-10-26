# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=amdgpu_top
pkgname=$_pkgname-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
arch=('x86_64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
depends=('libdrm')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}_amd64.deb")
sha256sums=('251de439da83866b61305b8d5ad3f11031cff25a790273da0d1bdf2ab84b1bc7')

prepare() {
  tar Jxpf data.tar.xz
}

package() {
  cd usr
  install -Dm644 share/doc/amdgpu-top/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 share/man/man1/$_pkgname.1.gz -t "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -Dm644 share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
}
