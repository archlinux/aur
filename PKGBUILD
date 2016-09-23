# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=noteshrink
pkgver=r27.ab3178d
pkgrel=1
pkgdesc="Convert scans of handwritten notes to beautiful, compact PDFs"
url='https://mzucker.github.io/2016/09/20/noteshrink.html'
arch=('any')
license=('MIT')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-pillow')
source=('git+http://github.com/mzucker/noteshrink.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    sed -i '1 s/python/python2/g' noteshrink.py
}



package() {
  cd "$srcdir/$pkgname"
  install -Dm755 noteshrink.py $pkgdir/usr/bin/noteshrink
}
