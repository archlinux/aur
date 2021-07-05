# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-metadata-editor'
pkgver='3.28.1'
pkgrel=1
pkgdesc='Nautilus extension with simple Metadata Editor'
arch=('i686' 'x86_64')
url="https://gitlab.com/nvlgit/${pkgname}-extension"
license=('GPL')
depends=('glib2' 'libnautilus-extension' 'taglib')
makedepends=('meson' 'vala')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://gitlab.com/nvlgit/${pkgname}-extension/-/archive/3.28.1/${pkgname}-extension-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('581d6d218c99671ffb01475789013afde098110fd233637eda99e9fa8c1a4a71')

build() {
	cd "${srcdir}/${pkgname}-extension-${pkgver}"
	meson builddir --prefix=/usr
	ninja -C builddir
}

package() {
	cd "${srcdir}/${pkgname}-extension-${pkgver}"
	DESTDIR="$pkgdir" meson install -C builddir
}

