pkgname=chika-plymouth-theme-git
pkgdesc='Chika Plymouth theme'
pkgver=r5.dede85e
pkgrel=1

url=https://git.jamjar.ws/strat/chika_plymouth
arch=('any')
license=('AGPLv3')
depends=()
optdepends=()
makedepends=('git')
provides=('chika-plymouth-theme=r5.dede85e')
source=("git+${url}.git")
sha512sums=(SKIP)

pkgver() {
	cd "${srcdir}/chika_plymouth"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/chika"
	cp -rT "${srcdir}/chika_plymouth/theme" "${pkgdir}/usr/share/plymouth/themes/chika"
}

