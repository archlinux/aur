# Maintainer: David Thurstenson thurstylark@gmail.com
pkgname=chirp-hg
pkgver=1.0
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from hg repo"
arch=('any')
url="http://chirp.danplanet.com/"
license=('GPL')
depends=('python2-lxml' 'python2-pyserial' 'desktop-file-utils' 'pygtk' 'curl')
makedepends=('mercurial')
provides=('chirp')
conflicts=('chirp' 'chirp-daily')
source=('chirp-hg::http://d-rats.com/hg/chirp.hg')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir/" --optipize=1
}
