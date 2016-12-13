# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=('guestwlan')
pkgver=1.0.1
pkgrel=1
pkgdesc="Easy & Secure Guest WLAN setup with QR code GUI and photodiashow."
arch=('any')
url="https://github.com/NicoHood/guestwlan"
license=('MIT')
depends=('create_ap' 'qrencode' 'python' 'python-kivy' 'python-configobj')
optdepends=('haveged: boost low entropy'
            'rng-tools: boost low entropy'
            'fakehwclock: Save/restore system clock on machines without RTC'
            'mtdev: Raspberry Pi touch screen support')
install="guestwlan.install"
backup=('etc/guestwlan.cfg'
        'etc/create_guest_ap.conf')
source=("guestwlan.install"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/NicoHood/guestwlan/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.sig::https://github.com/NicoHood/guestwlan/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('c9a1a174b600c52b47a8a1098887460694cfcfd0a30cb70616fae33ba04f8d683cb2b0b1de09cea8e6819a550c50de9cb92f6e37ed5be1214542f8379789ba59'
            '369a3858fb5a155a726614fc67e384373a5f6cc7e200b4edb775e6f9e8ed44ffcb3c0e6b6f36cba68858eb8ae5826c63e7772b9ee9c5e1937e0012764e0fbd01'
            'SKIP')
validpgpkeys=('97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161') # NicoHood

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
    install -Dm 644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
