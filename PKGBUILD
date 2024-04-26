# Maintainer: ole <ole@orhagen.no>

pkgname=python-klp-git
_pkgname=klp
pkgver=20240426.5a55949
pkgrel=2
_file=
pkgdesc="klp is a lightweight, command-line interface (CLI) tool for analyzing and understanding structured logs in various formats."
url="https://github.com/dloss/klp"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git')
provides=("python-klp")
conflicts=("python-klp")
source=("git+https://github.com/dloss/klp.git")
sha256sums=('SKIP')

pkgver() {
	  cd "$srcdir/$_pkgname"
	  git log -1 --format=%cd.%h --date=short | tr -d -
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir --parents "$pkgdir/usr/bin"
    install -m 755 klp.py "$pkgdir/usr/bin/klp"
}
