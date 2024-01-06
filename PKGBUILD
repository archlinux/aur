# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>
# Contributor: Leonidas Spyropoulos <artafinde AT gmail DOT com>

_extname=cpufreq
pkgname=gnome-shell-extension-$_extname
pkgver=50.0
pkgrel=1
pkgdesc="Gnome Shell CPU Frequency Monitor and Governor Manager."
arch=('any')
url="https://github.com/konkor/cpufreq"
license=('GPL3')
depends=(
	'dconf'
	'gnome-shell'
	'gjs'
	'hicolor-icon-theme'
)
makedepends=('gnome-common')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('686d8a262e353f4c7037d7798efc52b26a2fd05b3c66e6d21cd54e743bc1253d953d544bbd8f96ff996f123de32c7567b808fd42fc9029a7702c2a95102dff31')

build() {
	cd "cpufreq-$pkgver"
	./autogen.sh --prefix="/usr"
	make
}

package() {
	cd "cpufreq-$pkgver"
	DESTDIR="$pkgdir" make install
}
