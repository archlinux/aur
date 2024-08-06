# Maintainer: Yamashiro <dev cosmicheron com>

_pkgbase='zenstates'
_gitname='ZenStates-Linux'
pkgname="${_pkgbase}-git"
pkgver=r6.0bc27f4
pkgrel=2
pkgdesc="Dynamically edit AMD Ryzen processor P-States"
url="https://github.com/r4m0n/${_gitname}"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
arch=('any')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "${srcdir}/${_gitname}/zenstates.py" "${pkgdir}/usr/bin/zenstates"
	install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
