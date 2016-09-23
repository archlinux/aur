# Maintainer: Fernando Cladera <fcladera [at] fcladera [dot] com>

pkgname=page_dewarp
pkgver=r18.835c7bb
pkgrel=1
pkgdesc="Text page dewarping using a cubic sheet model"
url='https://mzucker.github.io/2016/08/15/page-dewarping.html'
arch=('any')
license=('MIT')
depends=('python2' 'opencv' 'python2-numpy' 'python2-scipy' 'python2-pillow')
source=('git+http://github.com/mzucker/page_dewarp.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    sed -i '1 s/python/python2/g' page_dewarp.py
}



package() {
  cd "$srcdir/$pkgname"
  install -Dm755 page_dewarp.py $pkgdir/usr/bin/page_dewarp
}
