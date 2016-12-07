#Maintainer: Benedikt Tissot <benedikt.tissot@googlemail.com>
#Contributor: Alex Gajewski <apagajewski@gmail.com>

_pkgname=ice
pkgname=ice-ssb
pkgver=5.2.3
pkgrel=1
pkgdesc='a simple Site Specific Browser for Firefox, Chromium and Google Chrome from "Peppermint OS" Project'
url='https://github.com/peppermintos/ice'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python" "python-gobject")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peppermintos/$_pkgname/archive/v$pkgver.tar.gz")
optdepends=("firefox: Browser to use" "chromium: Browser to use" "google-chrome: Browser to use")
sha256sums=('907c0261b75d0a2a2239cbe0dd0173f1bcebabb6fdfce05363be15e7b6a50e08')

package() {
	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
	# symlinks to use chromium and google-chrome, change this if you use other versions
  # chromium
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
  # google-chrome
  ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
