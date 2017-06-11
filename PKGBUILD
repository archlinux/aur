# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: spep <speps at aur dot archlinux dot org>

pkgname=python-pysynth-git
_pkgname=PySynth
pkgver=20170611.3441e61
pkgrel=1
pkgdesc="A simple music synthesizer for Python 3"
arch=(any)
url="http://mdoege.github.io/PySynth/"
license=('GPL')
depends=('python-numpy')
makedepends=('git')
source=("git://github.com/mdoege/PySynth.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="$pkgdir"
}

