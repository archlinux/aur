# Maintainer: Pierre Grasser <pierre.grasser@proton.me>

pkgname=cerebro-bin
_pkgname=${pkgname%-bin}
pkgver=0.10.0
pkgrel=1
pkgdesc="Open-source productivity booster with a brain"
arch=('x86_64')
url="https://www.cerebroapp.com/"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('cerebro')
conflicts=('cerebro')
source=("$pkgname-$pkgver.deb::https://github.com/cerebroapp/cerebro/releases/download/v${pkgver}/cerebro_${pkgver}_amd64.deb"
        "https://github.com/cerebroapp/cerebro/raw/master/LICENSE")
sha256sums=('fa5306e780a7b545959a87f8fecc357f4c938e722bd9b75f7c9ed781349f9602'
            'SKIP')

package() {
	cd "$srcdir"
    tar -xaf data.tar.xz -C "$pkgdir"
    mkdir --parents "$pkgdir/usr/bin"
    ln -sf /opt/Cerebro/cerebro "$pkgdir/usr/bin/cerebro"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
