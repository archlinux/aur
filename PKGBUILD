# Maintainer: J. Nathanael Philipp <nathanael@philipp.land>
pkgname=webledger
_pkgname=${pkgname#web}
provides=(${_pkgname})
pkgver=2.5.3
pkgrel=1
pkgdesc="Web based ledger"
arch=("any")
url="https://github.com/jnphilipp/ledger"
license=("GPL-3.0-or-later")
makedepends=("git" "help2man")
depends=("python" "python-django" "python-gobject" "python-dbus" "python-django-html-utils" "systemd" "uwsgi" "uwsgi-plugin-python")
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
