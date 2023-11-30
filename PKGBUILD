# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=amdgpu_top
pkgname=$_pkgname-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Tool that shows AMD GPU utilization (binary release)"
url="https://github.com/Umio-Yasuno/amdgpu_top"
arch=('x86_64')
license=('MIT')
depends=('libdrm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/releases/download/v$pkgver/amdgpu-top_${pkgver}-1_amd64.deb")
sha256sums=('154e9e4ed1c98e9eb9f8a211743b348d42ee95da517216881ae1844a75eb327a')

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
