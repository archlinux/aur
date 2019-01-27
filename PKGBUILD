# Maintainer: Manan Singh <mananapr@gmail.com>

pkgname=cfiles
pkgver=1.0
pkgrel=1
pkgdesc="A ncurses file manager writeen in C"
arch=('any')
url="https://github.com/mananapr/cfiles/"
license=('MIT')
depends=('ncurses' 'sed' 'fzf')
optdepends=('mediainfo: to see media info'
            'atool: for archive previews'
            'python-ueberzug-git: for image previews'
            'w3m: for image previews')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mananapr/cfiles/archive/v${pkgver}.tar.gz")
sha256sums=('1ce74b1c797532fce5bcb256b7b5b35eb119ad23220a2f8615241b68e23dc9c4')

build(){
  cd "cfiles-${pkgver}"
  make
}

package() {
  cd "pywal-${pkgver}"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 cfiles "$pkgdir/usr/local/bin/cfiles"
  install -Dm644 scripts/displayimg "$pkgdir/usr/local/bin/displayimg"
  install -Dm644 scripts/displayimg_uberzug "$pkgdir/usr/local/bin/displayimg_uberzug"
  install -Dm644 scripts/clearimg "$pkgdir/usr/local/bin/clearimg"
  install -Dm644 scripts/clearimg_uberzug "$pkgdir/usr/local/bin/clearimg_uberzug"
}
