# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

pkgname=openbox-theme-surreal
pkgver=20070916
pkgrel=2
pkgdesc='A dark gray theme for Openbox.'
arch=('any')
url='http://box-look.org/content/show.php?content=66397'
license=('GPL3')

depends=('openbox')
optdepends=(
	'openbox-git: for bleeding-edge openbox features'
)
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

# Mirror
# https://www.dropbox.com/s/k9k98zsrcjw7ue7/66397-Surreal.tar.bz2
source=(
	'http://box-look.org/CONTENT/content-files/66397-Surreal.tar.bz2'
	'osd_tweaks.patch'
)
sha512sums=(
	'7f8170f2296ceb47864fe7cd589e3807aa28be7d0d0dc1925a95641f0c78b8c3c265b6874e41559f8048f2ee1abfcd1c92031869172462719820919a810c63a8'
	'57b33aa31e180a5e3d95ab03445c91aafce6a14e31122de5cd407a9d2332d88488f6c66512c10a8a53e7821a92fbfa576d2d4b3cf54e90b86f90f1ca0d898235'
)

prepare() {
	cd ${srcdir}/Surreal
	patch ./openbox-3/themerc ../osd_tweaks.patch
}

package() {	
	# Copy theme
	mkdir -p ${pkgdir}/usr/share/themes
	cp -R ${srcdir}/Surreal ${pkgdir}/usr/share/themes
}