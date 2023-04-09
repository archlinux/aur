# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=amdgpu_top
pkgname=$_pkgname-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
arch=('x86_64')
url="https://github.com/Umio-Yasuno/amdgpu_top"
license=('MIT')
depends=('libdrm')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}_amd64.deb")
sha256sums=('8c4f8e3f3a4e45c5edb4e54f596ea6052411e06ef90713bf6c454f2c46d7f834')

package() {
  tar Jxpf data.tar.xz
  cd usr
  install -Dm644 share/doc/amdgpu-top/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 share/doc/$_pkgname/README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm755 bin/$_pkgname -t "${pkgdir}/usr/bin"
}
