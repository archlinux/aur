# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
pkgname=openfortivpn-webview-qt
pkgver=1.2.0
pkgrel=2
pkgdesc="Application to perform the SAML single sing-on and easily retrieve the SVPNCOOKIE needed by openfortivpn - Qt version"
arch=(x86_64)
url="https://github.com/gm-vm/openfortivpn-webview"
license=('MIT')
depends=(qt6-base qt6-webengine)
makedepends=(git)
optdepends=(openfortivpn)
# source=("$pkgname::git+https://github.com/gm-vm/openfortivpn-webview.git#tag=v$pkgver-electron")
source=("$pkgname::git+https://github.com/gm-vm/openfortivpn-webview.git#commit=48e831167c25f10a33b4fd793ba3442ff0c89099")
sha256sums=('SKIP')

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
