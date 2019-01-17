# Maintainer: Sajaysurya Ganesh <sajay.surya@gmail.com>

pkgname="python-pycolab-git"
pkgver="r21.1d808c2"
pkgrel=1
pkgdesc="DeepMind pycolab"
arch=('any')
url="https://github.com/deepmind/pycolab"
license=('Apache 2.0')
depends=('python-setuptools' 'python-numpy' 'python-scipy')
makedepends=('git')
source=('git+https://github.com/deepmind/pycolab.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/pycolab"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd pycolab
    python setup.py build
}

package() {
    cd pycolab
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
