# Maintainer: Soymadip <soumadip@zohomail.in>
pkgname=mpv-mpris2-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Rust implementation of the MPRIS v2 D-Bus interface for mpv"
arch=('x86_64')
url="https://github.com/eNV25/mpv-mpris2"
license=('GPL-3.0-or-later')
depends=('ffmpeg' 'mpv')
conflicts=('mpv-mpris' 'mpv-mpris-git')
options=('!strip' '!debug')
_target="${arch}-unknown-linux-musl"
source=("${url}/releases/download/v${pkgver}/mpv-mpris2-${_target}.tar.zst")
sha256sums=('SKIP')

package() {
  cd "mpv-mpris2-${_target}"

  install -Dm755 mpv-mpris2 "$pkgdir/usr/lib/mpv-mpris2/mpv-mpris2"
  install -d "$pkgdir/etc/mpv/scripts"
  ln -s /usr/lib/mpv-mpris2/mpv-mpris2 "$pkgdir/etc/mpv/scripts/mpris.run"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
