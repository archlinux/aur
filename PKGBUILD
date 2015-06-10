# Contributor: LPB <lpb612@gmail.com>
# Maintainer: gajjanag <gajjanagadde@gmail.com>
pkgname=jemdoc-mathjax-git
pkgver=235.487b094
pkgver() {
    cd "jemdoc_mathjax"
    echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=0
pkgdesc="a static site generator for creating simple academic websites"

arch=(any)
url="https://web.stanford.edu/~wsshin/jemdoc+mathjax.html"
license=('GPL')
depends=(python2)
source=('git+https://github.com/wsshin/jemdoc_mathjax.git')
sha1sums=('SKIP')

build() {
    cd "jemdoc_mathjax"
    sed -i '1s/python/python2/' jemdoc
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd "jemdoc_mathjax"
    install -Dm755 jemdoc $pkgdir/usr/bin
}

