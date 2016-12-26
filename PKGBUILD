# Maintainer: Nolan Clark <tweakdeveloper@gmail.com>
pkgname=adb-starter
pkgver=0.0.1
pkgrel=1
pkgdesc="Starts ADB daemon as root to avoid permissions errors"
url="https://github.com/tweakdeveloper/adb-starter"
arch=('any')
license=('MIT')
depends=('android-tools')
install=adb-starter.install
source=("https://github.com/tweakdeveloper/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('fbd521e372ae02b9e4c91e75cbbd13c2')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	mkdir -p "${pkgdir}/usr/lib/systemd/system"
	install -D -m644 adb-starter.service "${pkgdir}/usr/lib/systemd/system/"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
