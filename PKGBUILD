# Maintainer: katoh <katoh_at_mikage.ne.jp>

pkgname=azdrawing
pkgver=1.5
pkgrel=4
pkgdesc="Painting software for line art and comics."
arch=('i686' 'x86_64')
url="https://osdn.net/projects/azdrawing/"
license=('GPL3')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxft')
makedepends=('libxfixes')
source=("https://osdn.net/dl/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('bea6e70f3850b10d6ec1401f4bebc4e50c0699e8bf5339ec5c642094e1db194c')

build() {
	cd ${pkgname}-${pkgver}
	make prefix=/usr 
}

package() {
	cd ${pkgname}-${pkgver}
	make prefix=${pkgdir}/usr install
        rm ${pkgdir}/usr/share/icons/hicolor/icon-theme.cache # HACK: For `exists in filesystem` error.
}
