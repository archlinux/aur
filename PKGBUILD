
_pkgname='minq-caching-thing'
pkgname="python-${_pkgname}-git"
pkgver=r6.4165d276d6cdf0500af571d06f4666c8b7d7d5bc
pkgrel=1
pkgdesc='Python library for caching network requests'
arch=('any')
url="https://github.com/kuche1/${_pkgname}"
license=(GPL)
depends=('python')
makedepends=('python-setuptools' 'python-pip')
provides=("python-${_pkgname}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

check() {
    cd "$srcdir/${_pkgname}"
    #python3 setup.py check
}

package() {
    cd "$srcdir/${_pkgname}"
    #python setup.py install --root="$pkgdir/" --optimize=1
    PIP_CONFIG_FILE=/dev/null pip3 install --isolated --root="$pkgdir" --ignore-installed --no-deps .
}
