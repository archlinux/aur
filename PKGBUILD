# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=amdgpu_top-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
arch=('x86_64')
license=('MIT')
depends=('libdrm')
provides=("amdgpu_top")
conflicts=("amdgpu_top")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('fce89024266b21f60d3d465f84148ac76c8adbb6172e01512640a35730db6647')

prepare() {
  tar Jxpf data.tar.xz
}

package() {
  cd usr
  install -Dm644 share/doc/amdgpu-top/copyright -t "$pkgdir/usr/share/licenses/amdgpu_top"
  install -Dm644 share/man/man1/amdgpu_top.1.gz -t "$pkgdir/usr/share/man/man1"
  install -Dm644 share/applications/amdgpu_top.desktop -t "$pkgdir/usr/share/applications"
  install -Dm755 bin/amdgpu_top -t "$pkgdir/usr/bin"
}
