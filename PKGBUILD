_name=farge
pkgname="${_name}-git"
pkgver=20190723
pkgrel=1
pkgdesc="Click on a pixel on your screen and show its color value"
arch=('any')
url="https://github.com/sdushantha/${_name}"
license=('MIT')
depends=('bash'
	'imagemagick'
	'colorpicker'
	'feh'
	)
makedepends=('git')
optdepends=('mpv: alternative image viewer'
			'sxiv: alternate image viewer'
			)
provides=("${_name}")
conflicts=("${_name}")
source=("${_name}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/${_name}"
}

build() {
	cd "${srcdir}/${_name}"
	chmod 755 "${_name}"
}

package() {
	cd "${srcdir}/${_name}"
	mkdir -p "${pkgdir}/usr/bin"
	make DEST=${pkgdir}/usr/bin install
}

