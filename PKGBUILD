# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
pkgname=openfortivpn-webview-qt
pkgver=1.1.0
pkgrel=1
pkgdesc="Application to perform the SAML single sing-on and easily retrieve the SVPNCOOKIE needed by openfortivpn - Qt version"
arch=(x86_64)
url="https://github.com/gm-vm/openfortivpn-webview"
license=('MIT')
depends=(qt5-base qt5-webengine)
makedepends=(git)
optdepends=(openfortivpn)
source=("$pkgname::git+https://github.com/gm-vm/openfortivpn-webview.git#tag=v$pkgver-electron")
sha256sums=('SKIP')

build() {
	cd "$pkgname/openfortivpn-webview-qt"
	qmake .
	make
}

package() {
	cd "$pkgname"
    install -Dm755 openfortivpn-webview-qt/openfortivpn-webview "$pkgdir/usr/bin/openfortivpn-webview"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
