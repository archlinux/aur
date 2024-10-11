# Maintainer: Samuel Collins <samuel.collins@live.co.uk>
pkgname=openfortivpn-webview-qt
pkgver=1.2.3
pkgrel=2
pkgdesc="Application to perform the SAML single sing-on and easily retrieve the SVPNCOOKIE needed by openfortivpn - Qt version"
arch=(x86_64)
url="https://github.com/gm-vm/openfortivpn-webview"
license=('MIT')
depends=(qt6-base qt6-webengine)
makedepends=(git)
optdepends=(openfortivpn)
provides=(openfortivpn-webview)
source=("$pkgname::git+https://github.com/gm-vm/openfortivpn-webview.git#tag=v$pkgver-electron")
sha256sums=('40435cb64019cc3f014519fb277b6312ad7b7af2ac539cd26255655838d3d649')

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
