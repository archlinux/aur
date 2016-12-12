# Maintainer: Angel Angelov <hextwoa@gmail.com>

pkgname='python-records-git'
pkgver=229.4038d9d
pkgrel=1
pkgdesc="A library for making raw SQL queries to relational databases."
url="https://github.com/kennethreitz/records"
license=('MIT')
makedepends=('git' 'python-distribute')
depends=('python' 'python-requests' 'python-tablib' 'python-docopt' 'python-sqlalchemy')
provides=('python-records')
arch=('any')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "${srcdir}/records"
	 local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	 printf "%s" "${ver//-/.}"
}

build() {
    cd "${srcdir}/records"
    python3 setup.py build
}

package() {
    cd "${srcdir}/records"
    python3 setup.py install --root="$pkgdir/" --optimize=1
}

