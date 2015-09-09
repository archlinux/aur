#Maintainer: Benedikt Tissot <benedikt.tissot@googlemail.com>
#Contributor: Alex Gajewski <apagajewski@gmail.com>

_pkgname=ice
pkgname=ice-ssb
pkgver=5.1.3
pkgrel=1
pkgdesc='a simple Site Specific Browser for Firefox, Chromium and Google Chrome from "Peppermint OS" Project'
url='http://peppermintos.com/guide/ice/'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python" "python-gobject")
source=("$_pkgname-$pkgver.tar.gz::https://launchpad.net/~peppermintos/+archive/ubuntu/p6-release/+files/ice_5.1.3.tar.gz")
optdepends=("firefox: Browser to use" "chromium: Browser to use" "google-chrome: Browser to use")
sha256sums=('f28b2839249dbae7382905dd08200fd3f37ab5d216bf9a83c8f29651bbb585ee')

package() {
	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
	# symlinks to use chromium and google-chrome, change if you use other versions
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
        ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
