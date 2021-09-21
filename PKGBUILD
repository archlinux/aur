# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='nautilus-launch'
pkgver='1.0.6'
pkgrel=1
pkgdesc='A simple Nautilus extension that allows to run executables and launchers via right-click menu'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/madmurphy/nautilus-launch'
license=('GPL')
depends=('glib2' 'libnautilus-extension')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("https://github.com/madmurphy/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-with-configure.tar.gz")
install="${pkgname}.install"
sha256sums=('a24cdf65bb9a52f038b163c299c44d691b4aa295cfbc94fd4ef96ad5ea0ed1d6')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

