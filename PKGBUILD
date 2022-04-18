# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=diann
pkgver=1.8.1
pkgrel=1
epoch=
pkgdesc="DIA-NN - a universal software for data-independent acquisition (DIA) proteomics data processing"
arch=('x86_64')
url="https://github.com/vdemichev/DiaNN"
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/vdemichev/DiaNN/releases/download/${pkgver}/${pkgname}_${pkgver}.deb"
        "https://raw.githubusercontent.com/vdemichev/DiaNN/master/LICENSE.txt")
noextract=()
sha256sums=('2c38201b5e04e9e0df621ba053bbad93d70dc9b23bd6e0b78a1f6b22315cc1c0'
            'SKIP')
validpgpkeys=()

package() {
	tar -zxvf data.tar.gz -C $pkgdir
	mkdir -pv $pkgdir/usr/bin
	ln -sv /usr/$pkgname/$pkgver/${pkgname}-${pkgver} $pkgdir/usr/bin/diann
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
