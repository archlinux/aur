# Maintainer: Toke Høiland-Jørgensen <toke at toke dot dk>
# Contributor: Luca Lemmo <luca at linux dot com>

pkgname=flent-git
pkgver=0.14.0.r68.fa69bef
pkgrel=1
pkgdesc='The FLExible Network Tester.'
arch=('any')
url='https://flent.org'
license=('GPL')
depends=('python' 'netperf' 'python-setuptools')
makedepends=('git')
provides=('flent')
conflicts=('netperf-wrapper' 'flent')
replaces=('netperf-wrapper')
optdepends=(
	'python-matplotlib: for outputting graphs'
	'python-pyqt4: for the GUI'
)
source=(git+https://github.com/tohojo/flent.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"

	python setup.py install --single-version-externally-managed --root="$pkgdir" --optimize=1
}
