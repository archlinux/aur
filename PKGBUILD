pkgname=feather-wallet-bin
pkgver=2.8.1
pkgrel=1
pkgdesc="A free and open-source Monero desktop wallet."
arch=('x86_64')
url="https://featherwallet.org"
license=('BSD')
depends=()
provides=('feather-wallet')
conflicts=('featherwallet-bin')
source=("feather-${pkgver}-linux.zip::https://github.com/feather-wallet/feather/releases/download/${pkgver}/feather-${pkgver}-linux.zip")
sha256sums=('4779c57e9443f7755add3c2414447d1593ebe06998e39a9f765deab5bd64c466')
noextract=("feather-${pkgver}-linux.zip")

package() {
    install -dm755 "$pkgdir/opt/feather"
    bsdtar -xf "${srcdir}/feather-${pkgver}-linux.zip" -C "$pkgdir/opt/feather" --strip-components=1
    chmod +x "$pkgdir/opt/feather/feather"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/feather/feather "$pkgdir/usr/bin/feather"
}
