# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=openbox-theme-mistral
pkgver=20150704
pkgrel=1
pkgdesc='A Breeze style for Openbox.'
arch=('any')
url='http://phobi4n.deviantart.com/art/Mistral-Openbox-543910044'
license=('license-free')

depends=('openbox')
optdepends=(
	'openbox-git: for bleeding-edge openbox features'
)
makedepends=('p7zip')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

# Mirror
# https://www.dropbox.com/s/p3q19muy49qjkhs/mistral_openbox_by_phobi4n-d8ztvoc.7z
source=(
	"${pkgname}-${pkgver}.7z::http://orig01.deviantart.net/2870/f/2015/184/6/8/mistral_openbox_by_phobi4n-d8ztvoc.7z"
)
noextract=(
	"${pkgname}-${pkgver}.7z"
)
sha512sums=(
	'45113db8af5c7012f40192067790165bbc56aa1a25d333d0d87ab53241e8a00227408337ad6363ba213cae3ea450c8ac12ab141a45fbaeaae0b26390a8b34e9c'
)

prepare() {
	# Decompressing the file
	cd ${srcdir}
	7z x ${pkgname}-${pkgver}.7z
}

package() {	
	# Copy theme
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R ${srcdir}/Mistral ${pkgdir}/usr/share/themes
}