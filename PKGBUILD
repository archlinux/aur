# Maintainer:  Tjaart van der walt <aur@tjaart.co.za>

pkgname=lfm3-hg
pkgver=20150810
pkgrel=2
pkgdesc="A powerful file manager for the UNIX console. Written in Python 3.4+"
arch=('any')
url="https://bitbucket.org/inigoserna/lfm3"
license=('GPL3')
conflicts=('lfm' 'lfm-hg')

depends=('ncurses>=5.0' 'python>=3.4')
makedepends=('mercurial')
source=(hg+https://bitbucket.org/inigoserna/lfm3)

md5sums=('SKIP')

build() {
  cd "$srcdir/lfm3"
  python setup.py build
}

package() {
  cd "$srcdir/lfm3"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
