#Maintainer: Fernando Guevara <admin@ebadoo.com>

_pkgname=ice-dev
pkgname=ice-dev
pkgver=6.1.0
pkgrel=1
pkgdesc='A simple Site Specific Browser for Firefox, Chromium and Google Chrome from "Peppermint OS" Project'
url='https://github.com/ebadoo/ice-dev'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python-gobject" "python-lxml")
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('AD3F3CEB76C191B18AE8BBAE44147CA2')
optdepends=("firefox: Browser to use" "chromium: Browser to use" "google-chrome: Browser to use" "vivaldi: Browser to use")

package() {

	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
        chmod -R o+rwx "${pkgdir}/usr/bin/ice" "${pkgdir}/usr/bin/ice-firefox"
	# symlinks to use chromium and google-chrome, change this if you use other versions
  # chromium
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
  # google-chrome
	ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
