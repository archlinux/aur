# Maintainer: ROllerozxa (rollerozxa@voxelmanip.se)
pkgname=minetest-update-translations-git
pkgver=r58.5221cfa
pkgrel=1
pkgdesc='A Python script for updating the translation files of a Minetest mod'
arch=('any')
url="https://github.com/minetest-tools/update_translations"
license=('LGPLv2.1')
depends=('python')
makedepends=('git')
source=("git+https://github.com/minetest-tools/update_translations")
md5sums=('SKIP')
options=(!strip)

pkgver() {
	cd "${srcdir}/update_translations"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/update_translations"
	install -Dm755 "i18n.py" "${pkgdir}/usr/bin/update-translations"
	install -Dm644 "bash-completion/completions/i18n" "${pkgdir}/usr/share/bash-completion/completions/update-translations"
}
