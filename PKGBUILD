# Maintainer: Pierre Grasser <pierre.grasser@proton.me>

pkgname=cerebro-bin
_pkgname=${pkgname%-bin}
pkgver=0.11.0
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
sha256sums=('28416ba5274580ae42883f937538fc3d247cf426c744603cebce93273c184e10'
            '9f617ac32be4499f5c478c563a69a202d3c24dbda80b1cb36ea5a2230b40733c')

package() {
    cd "$srcdir"
    tar -xaf data.tar.xz -C "$pkgdir"
    mkdir --parents "$pkgdir/usr/bin"
    ln -sf /opt/Cerebro/cerebro "$pkgdir/usr/bin/cerebro"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
