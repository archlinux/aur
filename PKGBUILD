
pkgname=python-minq-storage-git
pkgver=r2.8d95d7790d45f947258b66096b0b103442adb318
pkgrel=1
pkgdesc='Python package for caching network requests'
arch=('any')
url='https://github.com/kuche1/minq-storage'
license=()
depends=('python')
makedepends=('python-setuptools' 'python-pip')
provides=('python-minq-storage')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/minq_storage
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

check() {
    cd $srcdir/minq_storage
    #python3 setup.py check
}

package() {
    cd $srcdir/minq_storage
    #python setup.py install --root="$pkgdir/" --optimize=1
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
