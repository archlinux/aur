# Maintainer: Juri Vitali <juri@dividebyzero.it>

pkgname=efiedit
pkgver=1.0
pkgrel=1
pkgdesc="Efibootmgr wrapper to view and edit boot entries"
arch=('i686' 'x86_64')
url="https://github.com/Juma7C9/Efiedit"
license=('GPL3')
depends=('efibootmgr')
options=('strip')
source=("https://github.com/Juma7C9/Efiedit/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('35a1393f9bf43bdecb7b98ccdcd23e202cee8bf04190f773f53138159af51bd7')


build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"
	install -Dm 0755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm 0644 "example.conf" "$pkgdir/usr/lib/$pkgname/$pkgname.conf.example"
	install -Dm 0644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
