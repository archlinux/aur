# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-icon-theme
_pkgname=arc-icon-theme
pkgver=20160605
pkgrel=1
pkgdesc='Arc icon theme. Official releases only.'
arch=(any)
url=https://github.com/horst3180/arc-icon-theme
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('automake' 'unzip')
optdepends=('moka-icon-theme-git: Arc icon theme was built to be used 
on top of Moka icon theme')
source=(https://github.com/horst3180/${_pkgname}/archive/${pkgver}.zip)
md5sums=('6b7739e97253e1a02f917d883f57d131')
conflicts=('arc-icon-theme-git')


build() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
