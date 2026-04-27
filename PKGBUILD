# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
# Maintainer: tee < teeaur at duck dot com >
pkgname=ecode-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance"
url="https://github.com/SpartanJ/ecode"
license=('MIT')
arch=('x86_64')
depends=(glibc bash libelf libglvnd hicolor-icon-theme sdl2)
provides=(ecode)
source=("$url/raw/ecode-$pkgver/LICENSE")
source_x86_64=("$url/releases/download/ecode-$pkgver/ecode-linux-$pkgver-$arch.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('13fce12c032b13eb038add79f91b9689d71a01b5b91e2cb87045b2408ebf0b32')

package() {
  install -Dm755 ecode/{ecode,ecode.bin} -t "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/ecode" -t "$pkgdir/usr/bin"
  cp -av ecode/libs "$pkgdir/opt/$pkgname/"
  cp -av ecode/assets "$pkgdir/opt/$pkgname/"
  install -Dm644 ecode/ecode.desktop -t "$pkgdir"/usr/share/applications/
#  install -Dm644 ecode/ecode.png -t "$pkgdir"/usr/share/pixmaps/
  install -Dm644 ecode/ecode.png -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
