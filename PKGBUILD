# Maintainer: Ckat <ckat@teknik.io>
pkgname=fuf
pkgver=0.4.20
pkgrel=1
pkgdesc='Fairly Usable cli Filebrowser.'
arch=('any')
url=https://github.com/ckath/fuf
license=('MIT')
depends=('ncurses')
optdepends=('w3m: image previews')
conflicts=('fuf-git')
provides=('fuf')
install=fuf.install
source=("https://github.com/Ckath/fuf/archive/v$pkgver.tar.gz")
md5sums=('1af6b08ba747790638b037f654efb994')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION="$pkgver"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 fuf "$pkgdir/usr/bin/fuf"
  install -Dm755 scripts/open "$pkgdir/usr/lib/$pkgname/open"
  install -Dm755 scripts/preview "$pkgdir/usr/lib/$pkgname/preview"
  install -Dm644 completions/bash/fuf "$pkgdir/usr/share/bash-completion/completions/fuf"
  install -Dm644 completions/zsh/_fuf "$pkgdir/usr/share/zsh/site-functions/_fuf"
}
