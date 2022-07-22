# Maintainer: Charles Vejnar <first name [dot] last name [at] gmail [dot] com>

pkgname=python-momoko
pkgver=2.2.5.1
pkgrel=1
pkgdesc="Asynchronous Psycopg wrapper for Tornado."
arch=("any")
url="http://momoko.61924.nl"
license=("MIT")
depends=('python'
         'python-tornado'
         'python-psycopg2')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("https://github.com/FSX/momoko/archive/v$pkgver.tar.gz")
sha1sums=('65156ce1054126a75a1b34d923f251ca997e44f2')

build() {
    cd "$srcdir/momoko-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/momoko-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
