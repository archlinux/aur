# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=amdgpu_top
pkgname=$_pkgname-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
arch=('x86_64')
license=('MIT')
depends=('libdrm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('a0964254c765d7d76a65528c5bbf7bb2161d0417dd898a6f01ad41d6ac8ce455')

prepare() {
  tar Jxpf data.tar.xz
}

package() {
  cd usr
  install -Dm644 share/doc/amdgpu-top/copyright -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 share/man/man1/$_pkgname.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
}
