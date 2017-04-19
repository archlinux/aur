# Maintainer: emersion <contact@emersion.fr>
_pkgname=pass-rotate
pkgname=$_pkgname-git
pkgver=r0.a88a767
pkgrel=1
pkgdesc="A tool and library for rotating your password on online services"
arch=('any')
url="https://github.com/SirCmpwn/pass-rotate"
license=('MIT')
groups=()
depends=('python' 'python-beautifulsoup4' 'python-docopt' 'python-requests')
makedepends=()
provides=('pass-rotate')
conflicts=('pass-rotate')
replaces=()
backup=()
options=(!emptydirs)
install=
source=('git+https://github.com/SirCmpwn/pass-rotate.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long --tags --all | cut -d - -f 2- | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1
}
