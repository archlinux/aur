#Maintainer: Benedikt Tissot <benedikt.tissot@googlemail.com>
#Contributor: Alex Gajewski <apagajewski@gmail.com>

_pkgname=ice
pkgname=ice-ssb
pkgver=5.0.1
pkgrel=1
pkgdesc='a simple Site Specific Browser for Chromium and Google Chrome from "Peppermint OS" Project'
url='http://peppermintos.com/guide/ice/'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python" "python-gobject")
source=("$_pkgname-$pkgver.tar.gz::https://launchpad.net/~peppermintos/+archive/ubuntu/p6-release/+files/ice_5.0.1.tar.gz")
optdepends=("chromium: Browser to use" "google-chrome: Browser to use")
sha256sums=('51e611d38950a216a45bf426b808f6e90b375304106036dd68a9ec246522705c')

package() {
	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
	# symlinks to use chromium and google-chrome, change if you use other versions
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
        ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
