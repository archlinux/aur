# Maintainer: birbkeks birbkeks@proton.me

pkgname=win10-sddm-theme
pkgver=1.2
pkgrel=1
pkgdesc="Windows 10 login screen theme for SDDM."
arch=(x86_64)
url="https://github.com/birbkeks/win10-sddm-theme"
license=('MIT')

depends=(sddm)

provides=('win10-sddm-theme')

source=("https://github.com/birbkeks/win10-sddm-theme/releases/download/1.2/win10-sddm-theme.tar.gz")
md5sums=('SKIP')

options=(!debug)

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sddm/themes/"
	wget -P "${srcdir}/win10-sddm-theme/fonts" https://aka.ms/SegoeFonts -nc
	bsdtar xf "${srcdir}/win10-sddm-theme/fonts/SegoeFonts" -C "${srcdir}/win10-sddm-theme/fonts/"
	cp -r win10-sddm-theme/ "${pkgdir}/usr/share/sddm/themes/"
}

