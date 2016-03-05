#Maintainer: Benedikt Tissot <benedikt.tissot@googlemail.com>
#Contributor: Alex Gajewski <apagajewski@gmail.com>

_pkgname=ice
pkgname=ice-ssb
pkgver=5.1.4
pkgrel=2
pkgdesc='a simple Site Specific Browser for Firefox, Chromium and Google Chrome from "Peppermint OS" Project'
url='https://github.com/peppermintos/ice'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python" "python-gobject")
source=("$_pkgname-$pkgver.tar.gz::https://launchpad.net/~peppermintos/+archive/ubuntu/p6-release/+files/ice_5.1.4.tar.gz")
optdepends=("firefox: Browser to use" "chromium: Browser to use" "google-chrome: Browser to use")
sha256sums=('6e59b061d553cce3d87f5008cb20a10d36a810a78494158b007aeb3ad304f1a0')

package() {
	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
	# symlinks to use chromium and google-chrome, change if you use other versions
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
        ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
