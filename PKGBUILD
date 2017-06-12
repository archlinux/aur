
# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname='cmus-in-bg-git'
pkgver=r1.1bc065d
pkgrel=1
pkgdesc="A simple wrapper for GNU Screen and Cmus."
arch=('any')
url="https://github.com/notramo/cmus-in-bg"
license=('MIT')
depends=('perl-proc-processtable')
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
	install -D cmus-in-bg $pkgdir/usr/bin/cmusn-in-bg
	install -D cmus-in-bg-terminal $pkgdir/usr/bin/cmusn-in-bg-terminal
	install -D COPYING $pkgdir/usr/share/licenses/cmus-in-bg-git/LICENSE
}
