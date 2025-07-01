# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Maz <m47h4r at gmail dot com>
# Contributor: Molyuu <zhangjtroger at gmail dot com>
# Contributor: Mikhail Velichko <efklid at gnail dot com >

pkgname=nekoray-bin
pkgver=4.0.1
_releasedate=2024-12-12
pkgrel=3
pkgdesc="Qt based cross-platform GUI proxy configuration manager (backend: sing-box)"
arch=('x86_64')
url="https://github.com/MatsuriDayo/nekoray"
license=('GPL 3.0')
groups=()
depends=('qt5-base>=5.15' 'qt5-svg' 'qt5-x11extras' 'sing-geosite-db' 'sing-geoip-db')
provides=('nekobox')
conflicts=('nekoray-git' 'nekoray' 'nekoray-mahdi-zarei-bin')

source=(
  "${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/nekoray-${pkgver}-${_releasedate}-linux64.zip"
  "nekoray.desktop"
  "nekoray.sh"
)

sha256sums=(
	'703a0ee452f8ea031bb54144c9460af9afeb84110da34420c338f134346e7ca5'
	'1d2fb122bc4a2ce526b923e25731071e6e3c5016f0796ea08fc2ac13cd0c1356'
	'afeddf3fd70fbfb3af5d80aab86279daadca14eaa3413cd8fd34796eace08367'
)

package() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/lib/nekoray/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/128x128/apps/

  install -Dt ${pkgdir}/usr/lib/nekoray/ -m755 ./nekoray/nekobox_core
  install -Dt ${pkgdir}/usr/lib/nekoray/ -m755 ./nekoray/nekobox
  install -Dm755 ./nekoray.sh ${pkgdir}/usr/bin/nekoray

  install -Dt ${pkgdir}/usr/share/applications/ -m644 ./nekoray.desktop
  install -Dt ${pkgdir}/usr/share/icons/hicolor/128x128/apps/ -m644 ./nekoray/nekobox.png
}

