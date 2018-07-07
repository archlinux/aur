# Maintainer: Sajaysurya Ganesh <sajay.surya@gmail.com>

pkgname="python-pycolab-git"
pkgver="1"
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
    python setup.py build
}

package() {
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
