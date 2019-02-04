# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('slime-forest-demo')
pkgver=build189
pkgrel=1
pkgdesc="Adventure game to fight slimes, save a princess, and learn Japanese"
arch=('x86_64')
url='https://lrnj.com'
license=('custom')
depends=('sdl2')
options=(!emptydirs)
source=("https://lrnj.com/sfa.tgz"
        "LICENSE.txt"
        "run.sh")
sha256sums=('4174b0cb4b322da5234b6428ebaf6d5d8560c4ee07f92bcb1b9361dbc5aa9c89'
            'SKIP'
            'SKIP')

package() {
  cd "$srcdir/slimeforest"
  mkdir -p "$pkgdir/usr/share/$pkgname/"
  cp -a *.txt jquest/{exec.ver,images,maps,jquest64,*.wad} \
        "$pkgdir/usr/share/$pkgname/"
  cd ..
  install -Dm755 run.sh "$pkgdir/usr/bin/slime-forest-demo"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
