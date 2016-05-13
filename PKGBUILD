# Maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname='wilink'
pkgver='2.4.906'
pkgrel='2'
pkgdesc='Instant messaging client and SIP softphone for Wifirst customers'
arch=('i686' 'x86_64')
url='https://github.com/jlaine/wilink'
license=('GPL3')
depends=('libxss' 'qxmpp' 'qt5-multimedia' 'qt5-x11extras' 'qt5-quickcontrols' 'qt5-webkit' 'desktop-file-utils' 'hicolor-icon-theme')
source=("https://github.com/jlaine/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('60f912e2ae958e6b7e809a57e08d4a3a57d36ed6')
 
build() {
	cd "$srcdir/$pkgname-$pkgver/"
	[ -d build ] || mkdir build && cd "build/"
	qmake-qt5 PREFIX=/usr WILINK_SYSTEM_QXMPP=1 ..
	make
}

package() {
	# installing
	cd "$srcdir/$pkgname-$pkgver/build/"
	make INSTALL_ROOT="$pkgdir/" install
}
