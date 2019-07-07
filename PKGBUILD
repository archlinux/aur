# Maintainer: Ignat Insarov <kindaro@gmail.com>
pkgname=ttf-inconsolata-lgc-git
_pkgname=ttf-inconsolata-lgc
pkgver=1.3.0
pkgrel=1
pkgdesc="a modified version of Inconsolata with added Cyrillic alphabet"
url="https://github.com/MihailJP/Inconsolata-LGC/"
arch=('any')
license=('OFL')
makedepends=('git' 'fontforge')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/MihailJP/Inconsolata-LGC.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | grep -Po '(\d\.)+\d'
}

build() {
  cd $_pkgname
  make ttf
}

package() {
  cd $_pkgname
  install -m644 -D Inconsolata-LGC.ttf\
    "$pkgdir/usr/share/fonts/TTF/InconsolataLGC.ttf"
  install -m644 -D Inconsolata-LGC-Bold.ttf\
    "$pkgdir/usr/share/fonts/TTF/InconsolataLGC-Bold.ttf"
  install -m644 -D Inconsolata-LGC-Italic.ttf\
    "$pkgdir/usr/share/fonts/TTF/InconsolataLGC-Italic.ttf"
  install -m644 -D Inconsolata-LGC-BoldItalic.ttf\
    "$pkgdir/usr/share/fonts/TTF/InconsolataLGC-BoldItalic.ttf"

  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$_pkgname/README"
}

# vim:ts=2:sw=2:et:
