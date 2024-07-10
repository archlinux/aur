# Maintainer: birbkeks birbkeks@proton.me

pkgname=win11-sddm-theme
pkgver=1.0
pkgrel=1
pkgdesc="Windows 11 login screen theme for SDDM."
arch=(x86_64)
url="https://github.com/birbkeks/win11-sddm-theme"
license=('MIT')

depends=(sddm)

provides=('win11-sddm-theme')

source=("https://github.com/birbkeks/win11-sddm-theme/releases/download/1.0/win11-sddm-theme.tar.gz")
md5sums=('SKIP')

options=(!debug)

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/"

	wget -P "${srcdir}/win11-sddm-theme/fonts/SegoeUI-VF" https://aka.ms/SegoeUIVariable -nc

	bsdtar xf "${srcdir}/win11-sddm-theme/fonts/SegoeUI-VF/SegoeUIVariable" -C "${srcdir}/win11-sddm-theme/fonts/SegoeUI-VF"


	wget -P "${srcdir}/win11-sddm-theme/fonts/Segoe-Fluent-Icons/" https://aka.ms/SegoeFluentIcons -nc

	bsdtar xf "${srcdir}/win11-sddm-theme/fonts/Segoe-Fluent-Icons/SegoeFluentIcons" -C "${srcdir}/win11-sddm-theme/fonts/Segoe-Fluent-Icons"

	mv "${srcdir}/win11-sddm-theme/fonts/Segoe-Fluent-Icons/Segoe Fluent Icons.ttf" "${srcdir}/win11-sddm-theme/fonts/Segoe-Fluent-Icons/Segoe-Fluent-Icons.ttf"

	cp -r win11-sddm-theme/ "${pkgdir}/usr/share/sddm/themes/"
}

