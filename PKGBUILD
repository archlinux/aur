pkgname=zenstates-git
_gitname=ZenStates-Linux
pkgver=r6.0bc27f4
pkgrel=1
pkgdesc="Dynamically edit AMD Ryzen processor P-States"
url="https://github.com/r4m0n/${_gitname}"
license=(MIT)
depends=(python)
makedepends=(git)
arch=(any)
source=("git+https://github.com/r4m0n/${_gitname}.git")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -Dm755 "${srcdir}/${_gitname}/zenstates.py" "${pkgdir}/usr/bin/zenstates"
}

# makepkg -g >> PKGBUILD
md5sums=('SKIP')
