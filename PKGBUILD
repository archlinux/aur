# Maintainer: J. Nathanael Philipp <nathanael@philipp.land>
pkgname=webledger
_pkgname=${pkgname#web}
provides=(${_pkgname})
pkgver=2.2.2
pkgrel=1
pkgdesc="Web based ledger"
arch=("any")
url="https://github.com/jnphilipp/ledger"
license=("GPL3+")
makedepends=("git" "help2man")
depends=("python" "python-django" "python-gobject" "python-dbus" "python-django_bootstrap5" "systemd" "uwsgi" "uwsgi-plugin-python")
source=("git+https://github.com/jnphilipp/ledger.git")
md5sums=(SKIP)

check() {
    cd "$srcdir/$_pkgname"
    git checkout $pkgver
    make clean
    make test
}

package() {
    cd "$srcdir/$_pkgname"
    git checkout $pkgver
    make install DEST_DIR=$pkgdir
}
