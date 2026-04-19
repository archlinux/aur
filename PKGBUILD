# Maintainer: Your Name <your.email@example.com>
# Contributor: 

pkgname=fighter-1
pkgver=1.0.0
pkgrel=1
pkgdesc="A fighting game written in Python."
arch=('any')
url="https://github.com/EvansOgala/Fighter"
license=('MIT')
depends=('python' 'python-pygame')
makedepends=('git')
source=("fighter-1::git+https://github.com/EvansOgala/Fighter.git"
        "icon.png"
        "Fighter.desktop"
        "fighter-1.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

build() {
  cd "$srcdir/fighter-1"
}

package() {
  cd "$srcdir/fighter-1"
  install -Dm755 "$srcdir/fighter-1.sh" "$pkgdir/usr/bin/fighter-1"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 assets/original/gfx/icon.png "$pkgdir/usr/share/pixmaps/fighter-1.png"
  install -Dm644 Fighter.desktop "$pkgdir/usr/share/applications/fighter-1.desktop"
  install -d "$pkgdir/usr/share/fighter-1"
  cp -r assets "$pkgdir/usr/share/fighter-1/"
  cp -r fighter "$pkgdir/usr/share/fighter-1/"
}
