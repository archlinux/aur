pkgname=flandre-grub-theme-git
pkgdesc='Flandre scarlet GRUB2 theme'
pkgver=r4.e02b06a
pkgrel=3

url=https://git.jamjar.ws/strat/flandre_grub
arch=('any')
license=('MIT')
depends=()
optdepends=()
makedepends=('git')
provides=('flandre-grub-theme=r4.e02b06a')
source=("git+${url}.git")
sha512sums=(SKIP)

pkgver() {
	cd "${srcdir}/flandre_grub"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "${pkgdir}/usr/share/grub/themes/flandre"
	cp -rT "${srcdir}/flandre_grub/theme" "${pkgdir}/usr/share/grub/themes/flandre"
}

