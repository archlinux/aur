# Maintainer: Joaquin Garmendia <joaquingc123 at gmail dot com>
# Contributor: Orestis Floros <orestisf1993@gmail.com>

# All my PKGBUILDs can be found in https://www.github.com/joaquingx/PKGBUILDs

pkgname=gtk-arc-flatabulous-theme
pkgver=20180201
pkgrel=1
pkgdesc="Arc theme with Flatabulous window controls."
arch=('any')
url="https://github.com/andreisergiu98/${pkgname#gtk\-}"
license=('GPL3')
makedepends=('git' 'gtk3' 'sassc')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gnome-themes-standard: for gtk2 themes'
            'arc-icon-theme: recommended icon theme'
            'gtk3: for gtk3 themes'
           )
source=("https://github.com/andreisergiu98/${pkgname#gtk\-}/archive/${pkgver}.tar.gz")
sha256sums=('37c4a748273ed32cc5ec16fa083dfc4f708374b1a9811b03baf311265f6b5f4d')

prepare() {
	cd "${srcdir}/${pkgname#gtk\-}-${pkgver}"
	autoreconf -fi 
}

build() {
	cd "${srcdir}/${pkgname#gtk\-}-${pkgver}"
	./configure --prefix=/usr
}

package() {
	cd "${srcdir}/${pkgname#gtk\-}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
