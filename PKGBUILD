# Maintainer: Dusan Maliarik <dusan@struna.me>
pkgname=gyroflow-appimage
pkgver=1.0.0rc1
_pkgver=1.0.0-rc1
pkgrel=1
epoch=
pkgdesc="Video stabilization using gyroscope data"
arch=('x86_64')
url="https://gyroflow.xyz"
license=('GPL3')
groups=()
source=(
		"https://github.com/gyroflow/gyroflow/releases/download/v$_pkgver/Gyroflow-linux64.AppImage"
		"gyroflow.desktop")
md5sums=(
		'd482266d4217dc61f7b921f5471cb8c9'
		'SKIP')

prepare() {
  chmod +x Gyroflow-linux64.AppImage
}

package() {

	install -dm755 "${pkgdir}/opt/gyroflow"
	cp -a "${srcdir}/Gyroflow-linux64.AppImage" "${pkgdir}/opt/gyroflow/"

	install -dm755 "${pkgdir}/usr/share/applications"
	cp -a "${srcdir}/gyroflow.desktop" "${pkgdir}/usr/share/applications/"
}
