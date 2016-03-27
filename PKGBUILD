# Maintainer: Ammon Smith <ammon.i.smith@gmail.com>

_pkgname='days-until'
pkgname=$_pkgname-git
pkgver=0.1.3e97ed8
pkgrel=1
pkgdesc='A command-line program to give you the number of days until or since certain events.'
arch=('any')
url="https://gitlab.com/ammongit/$_pkgname"
license=('GPL2')
depends=('python')
makedepends=('git')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
options=()
source=("git+https://gitlab.com/ammongit/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
    echo "0.1.$(git describe --always)"
}

package() {
    cd "$srcdir/$_pkgname"
    install -D -m755 'days_until.py' "$pkgdir/usr/bin/daysuntil"
    install -D -m644 'sample_event_list.txt' "$pkgdir/usr/share/$_pkgname/sample_event_list.txt"
    install -D -m644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

