# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=zb-fetcher
pkgver=1.8.5
pkgrel=2
pkgdesc="Tool to monitor ZetaBoards forums for new posts"
arch=(any)
url=http://ikn.org.uk/ZetaBoards%20topic%20fetcher
license=(GPL3)
depends=("python2>=2.6" "pygtk>=2.6" python2-pycurl)
makedepends=(po4a)
source=("https://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=(96059ff9968b4ac8b3fba355e0d6cce6)

build () {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
