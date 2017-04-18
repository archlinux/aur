# maintainer: tagener-noisu @ GitHub
pkgname=otf-inconsolata-lgc-git
_pkgname=otf-inconsolata-lgc
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
  make otf
}

package() {
  cd $_pkgname
  install -m644 -D Inconsolata-LGC.otf\
    "$pkgdir/usr/share/fonts/OTF/InconsolataLGC.otf"
  install -m644 -D Inconsolata-LGC-Bold.otf\
    "$pkgdir/usr/share/fonts/OTF/InconsolataLGC-Bold.otf"
  install -m644 -D Inconsolata-LGC-Italic.otf\
    "$pkgdir/usr/share/fonts/OTF/InconsolataLGC-Italic.otf"
  install -m644 -D Inconsolata-LGC-BoldItalic.otf\
    "$pkgdir/usr/share/fonts/OTF/InconsolataLGC-BoldItalic.otf"

  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$_pkgname/README"
}

# vim:ts=2:sw=2:et:
