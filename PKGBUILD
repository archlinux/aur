# maintainer: tagener-noisu
pkgname=otf-inconsolata-lgc
_pkgname=inconsolata
pkgver=1.0.1
pkgrel=1
pkgdesc="a modified version of Inconsolata with added Cyrillic alphabet"
url="https://github.com/MihailJP/Inconsolata-LGC/"
arch=('any')
license=('OFL')
makedepends=('git' 'fontforge')
provides=($pkgname)
conflicts=($pkgname)
source=("$_pkgname::git+https://github.com/MihailJP/Inconsolata-LGC.git")
md5sums=('SKIP')

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

  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:ts=2:sw=2:et:
