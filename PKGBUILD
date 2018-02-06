# Maintainer: Tomáš Vyčítal <tom.vycital@gmail.com>

_pkgbase=pacman-conf-diff
pkgname=$_pkgbase-git
pkgver=v1.0.0.r0.gc6712f3
pkgrel=1
pkgdesc=''
arch=('any')
url='https://github.com/Thomaash/pacman-conf-diff'
license=('Unlicense')
makedepends=('git')
depends=('python')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
options=(!strip !emptydirs)
source=('git+https://github.com/Thomaash/pacman-conf-diff.git#branch=master')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgbase"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm 755 -t "$pkgdir/usr/bin" "$srcdir/$_pkgbase/${_pkgbase//-/_}"
}


