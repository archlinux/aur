# Maintainer: Mellich <>
# Contributor: Jonathon Fernyhough <>

pkgname=light-locker-settings
pkgver=1.5.4
pkgrel=1
pkgdesc='A simple GUI configuration utility for light-locker'
arch=('any')
url='https://github.com/Froggo8311/light-locker-settings'
license=('GPL')
depends=('intltool' 'light-locker' 'python-psutil' 'python-gobject')
optdepends=("xfce4-power-manager>=1.3.0: Sync settings with XFCE4")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Froggo8311/light-locker-settings/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('26c1b3cf2c6af0672d7fb15164902d09b431976658e252bcddf45b8f06d90f81')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
