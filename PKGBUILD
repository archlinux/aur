# Maintainer: Oleg Plakhotniuk <olegus8@gmail.com>
pkgname=toothris
pkgver=1.0.0
pkgrel=1
pkgdesc="Smooth Tetris clone with a few surprises."
arch=('any')
url="http://www.toothris.org"
license=('GPL3')
depends=('python2-pygame' 'python2-opengl' 'stackless-python2' 'python-rabbyt')
makedepends=('git' 'python2-pygame')
source=("git+https://github.com/toothris/toothris#tag=${pkgver}"
        "toothris-run")
md5sums=('SKIP'
         '6e159bf700c3a4d48d4bbc6ca8a16fa7')

build() {
    cd "$srcdir/$pkgname/src"
    python2 packres.py
    python2 -m compileall .
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir"/usr/{bin,lib/toothris}
    cp "$srcdir/toothris-run" "$pkgdir/usr/bin/toothris"
    cp -r src/*.pyc "$pkgdir/usr/lib/toothris"
}
