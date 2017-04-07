#Maintainer: Benedikt Tissot <benedikt.tissot@googlemail.com>
#Contributor: Alex Gajewski <apagajewski@gmail.com>

_pkgname=ice
pkgname=ice-ssb
pkgver=5.2.7
pkgrel=1
pkgdesc='a simple Site Specific Browser for Firefox, Chromium and Google Chrome from "Peppermint OS" Project'
url='https://github.com/peppermintos/ice'
arch=(any)
license=(GPL2)
depends=("python-requests" "python-beautifulsoup4" "python" "python-gobject")
source=("$_pkgname-$pkgver.tar.gz::https://github.com/peppermintos/$_pkgname/archive/v$pkgver.tar.gz")
optdepends=("firefox: Browser to use" "chromium: Browser to use" "google-chrome: Browser to use" "vivaldi: Browser to use")
sha256sums=('c34536e87bf0701c7fb774f327bf50d74ea2b7341c8693181b05fc772720b28a')

package() {
	cp -r -f "${srcdir}/$_pkgname-$pkgver/usr" "${pkgdir}/usr"
	# symlinks to use chromium and google-chrome, change this if you use other versions
  # chromium
	ln -s /usr/bin/chromium "${pkgdir}/usr/bin/chromium-browser"
  # google-chrome
  ln -s /usr/bin/google-chrome-stable "${pkgdir}/usr/bin/google-chrome"
}
