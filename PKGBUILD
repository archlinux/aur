# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.3
pkgrel=2
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config)
source=(camilladsp.default
        camilladsp.service
        camilladsp.yml)
source_armv7h=($url/releases/download/v$pkgver/camilladsp-linux-armv7.tar.gz)
source_aarch64=(${source_armv7h/armv7/aarch64})
sha256sums=('245d0ba135c81590ea5d8a1eb68741daf055192869128cad26242924dbcd5144'
            '2ddfad846b2a6e57a27302849c03e47e5ce062b3365cb67d8525c80963bef689'
            'b6de2f8223a7dec6782d14d7511f292d4771723f9d6379ab4aeb8b9b15c34d95')
sha256sums_armv7h=('0fa240fa9d96b9c57715616452fefc0ab6f5a091af2ae94449aa346d41ec90a4')
sha256sums_aarch64=('dab6f94363c97ad2569c458e53b04efdc571f2e7bbf94671378513a61ec1d9f3')

package() {
    cd $srcdir
    install -Dm 755 $pkgname $pkgdir/usr/bin/$pkgname
    install -d $pkgdir/etc/camilladsp/coeffs
    install -Dm 755 camilladsp.yml -t $pkgdir/etc/camilladsp/configs
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    install -Dm 644 camilladsp.default $pkgdir/etc/default/camilladsp
}
