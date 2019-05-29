#Maintainer: Ivan Marquesi Lerner <ivanml1992 @!@ gmail.com>
#Contributor: Benedikt Tissot <benedikt.tissot@googlemail.com>
#Contributor: Alex Gajewski <apagajewski@gmail.com>

_pkgname=ice
pkgname=ice-ssb
pkgver=6.0.3
pkgrel=1
pkgdesc='a simple Site Specific Browser for Firefox, Chromium and Google Chrome from "Peppermint OS" Project'
url='https://github.com/peppermintos/ice'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python-gobject" "python-lxml")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9212ec768d1bffa5b2d6350d0cde0b3b412eb2047cc110a9ff0d1a665e477805')
optdepends=("firefox: Browser to use" "chromium: Browser to use" "google-chrome: Browser to use" "vivaldi: Browser to use")

package() {
	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
	# symlinks to use chromium and google-chrome, change this if you use other versions
  # chromium
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
  # google-chrome
	ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
