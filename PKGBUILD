# Maintainer: Cindy Wang (CindyLinz) <cindylinz@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Gan Lu <rhythm.gan@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=scim-tables
pkgver=0.5.14.1
pkgrel=4
pkgdesc='Generic table input method module for SCIM'
url='https://github.com/scim-im/scim-tables'
arch=('x86_64')
license=('GPL')
depends=('scim')
makedepends=('intltool' 'pkgconf')
source=("https://downloads.sourceforge.net/sourceforge/scim/${pkgname}-${pkgver}.tar.gz")
sha512sums=('081e11e4d01792770becd8deb96b9d0ef10c9e1d5549322d0740d635cc55b2a5e2e74a4d4642763aacf626f0cd6b9855864192d00c74d86a6b97fc55df68d34a')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./bootstrap
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
