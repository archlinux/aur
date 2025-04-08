# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
pkgname=openfortivpn-webview-qt
pkgver=1.3.0
pkgrel=1
pkgdesc="Application to perform the SAML single sing-on and easily retrieve the SVPNCOOKIE needed by openfortivpn - Qt version"
arch=(x86_64)
url="https://github.com/gm-vm/openfortivpn-webview"
license=('MIT')
depends=(qt6-base qt6-webengine)
makedepends=(git)
optdepends=(openfortivpn)
provides=(openfortivpn-webview)
source=("$pkgname::git+https://github.com/gm-vm/openfortivpn-webview.git#tag=v$pkgver-qt")
sha256sums=('14429fafab081055573a11f0e51dada4c8b2cc21a3fbb3496861b2ec88846db9')

build() {
	cd "$pkgname/openfortivpn-webview-qt"
	qmake6 .
	make
}

package() {
	cd "$pkgname"
    install -Dm755 openfortivpn-webview-qt/openfortivpn-webview "$pkgdir/usr/bin/openfortivpn-webview"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
