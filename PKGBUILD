# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
# Maintainer: tee < teeaur at duck dot com >
pkgname=ecode-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Lightweight multi-platform code editor designed for modern hardware with a focus on responsiveness and performance"
url="https://github.com/SpartanJ/ecode"
license=(MIT)
arch=(x86_64)
depends=(glibc bash libelf libglvnd hicolor-icon-theme sdl2)
provides=(ecode)
source=("$url/raw/ecode-$pkgver/LICENSE")
source_x86_64=("$url/releases/download/ecode-$pkgver/ecode-linux-$pkgver-$arch.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('2806d68aa08e81e89eabd1c5eb440b6711a7758e08e2cd24138ea242a4354ade')

package() {
  install -Dm755 ecode/{ecode,ecode.bin} -t "$pkgdir/opt/$pkgname/"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/ecode" -t "$pkgdir/usr/bin"
  cp -a ecode/{libs,assets} "$pkgdir/opt/$pkgname/"
  install -Dm644 ecode/ecode.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 ecode/ecode.png -t "$pkgdir"/usr/share/icons/hicolor/256x256/apps/
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
