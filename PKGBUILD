# Maintainer: Chenx Dust <chenx_dust@outlook.com>

pkgname=waydroid-launcher-git
_gitown=chenx-dust
_gitdir=waydroid-launcher
pkgver=r1.58d7810
pkgrel=1
pkgdesc="For better launching Waydroid. Sources from Bazzite."
arch=('any')
url="https://github.com/${_gitown}/${_gitdir}"
license=('Apache')
groups=()
depends=('waydroid' 'wlr-randr' 'cage' 'polkit')
optdepends=(
	'waydroid-script-git: for easily managing waydroid'
)
makedepends=('git')
source=("${_gitdir}::git+https://github.com/${_gitown}/${_gitdir}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitdir}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitdir}"
	cp -rv "${srcdir}/${_gitdir}/usr" "${pkgdir}/usr"
	cp -rv "${srcdir}/${_gitdir}/etc" "${pkgdir}/etc"
	install -Dm644 "${srcdir}/${_gitdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
