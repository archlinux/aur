# Maintainer: Márton Szabó <notramo@vipmail.hu>
pkgname='cmus-in-bg-git'
pkgver=r3.a7a50a4
pkgrel=1
pkgdesc="A simple wrapper for GNU Screen and Cmus."
arch=('any')
url="https://github.com/notramo/cmus-in-bg"
license=('MIT')
depends=('perl-proc-processtable' 'screen')
makedepends=('git')
provides=('cmus-in-bg')
source=("git+https://github.com/notramo/cmus-in-bg.git")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/cmus-in-bg"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/cmus-in-bg"
	install -D cmus-in-bg $pkgdir/usr/bin/cmus-in-bg
	install -D cmus-in-bg-terminal $pkgdir/usr/bin/cmus-in-bg-terminal
	install -D COPYING $pkgdir/usr/share/licenses/cmus-in-bg-git/LICENSE
}
