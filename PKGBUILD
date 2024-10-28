# Maintainer: OGIOS <ogios@foxmail.com>
_pkgname=way-edges
pkgname=way-edges-bin
pkgver=0.1.6
pkgrel=1

pkgdesc="Hidden widget on screen edges"
arch=('x86_64' 'aarch64')
url="https://github.com/way-edges/way-edges"
license=('MIT')

provides=("$_pkgname")
conflicts=("$_pkgname"-git)

depends=('gtk4' 'gtk4-layer-shell' 'cairo' 'pango' 'wayland' 'glib2' 'pipewire-pulse')

_repo=way-edges/way-edges
_tar_name="$_pkgname"_linux-x86_64.tar.gz
_tar_rename="$pkgname"-"$pkgver"-"$pkgrel".tar.gz
source=("$_tar_rename"::https://github.com/"$_repo"/releases/download/"$pkgver"/"$_tar_name" https://raw.githubusercontent.com/"$_repo"/"$pkgver"/LICENSE)
sha256sums=('SKIP' 'SKIP')

options=(!debug)

build() {
  tar -zxf "$_tar_rename"
}

package() {
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
