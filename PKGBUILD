# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>

pkgname=plymouth-themes-adi1090x-git
pkgver=r47.5d88174
pkgrel=3
pkgdesc="The plymouth theme collection by adi1090x"
arch=('any')
url="https://github.com/adi1090x/plymouth-themes"
license=('GPL-3.0-only')
depends=('plymouth')
makedepends=('git')
optdepends=('cantarell-fonts: text support'
            'ttf-dejavu: text support')
source=("git+https://github.com/adi1090x/plymouth-themes.git")
b2sums=('SKIP')

pkgver() {
	cd "plymouth-themes"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "plymouth-themes"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes"
	for folder in pack*/*/; do
		cp -r "$folder"  "${pkgdir}/usr/share/plymouth/themes"
	done
}
