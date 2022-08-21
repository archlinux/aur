# Maintainer: Derek J. Clark <derekjohn dot clark at gmail dot com>
pkgname=crankshaft-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="Crankshaft lets you install and create plugins to add more functionality to your Steam client."
arch=('any')
url="https://crankshaft.space/"
license=('GPL')
groups=()
depends=('libappindicator-gtk3' 'js-beautify')
optdepends=()
makedepends=()
source=("https://github.com/pastaq/crankshaft/releases/download/0.2.4/crankshaft-v0.2.4.tar.gz")
sha256sums=('e53ee5237e2e0f95f6449086a89a9bf9dcc7c866f8f2f647725e903420df6913')
package() {
	cd "$srcdir/"
	mkdir -p ${pkgdir}/etc/systemd/user
	mkdir -p ${pkgdir}/usr/local/bin
	install -m755 crankshaft ${pkgdir}/usr/local/bin/crankshaft
	install -m644 autostart/crankshaft.service ${pkgdir}/etc/systemd/user/crankshaft.service
}
