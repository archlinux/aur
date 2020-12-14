# Maintainer: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgname=hysteria
pkgver=0.4.0
pkgrel=1
pkgdesc='Hysteria is a set of relay & proxy utilities that are specifically optimized for harsh network environments'
arch=('x86_64')
url='https://github.com/tobyxdd/hysteria'
license=('MIT')
install=${_pkgname}.install
source=("$_pkgname::https://github.com/tobyxdd/$_pkgname/releases/download/v$pkgver/hysteria-linux-amd64"
        'hysteria@.service'
        'hysteria-server@.service')

sha512sums=('2caae6587581984c0c084b53fea328f204ee62568ab760657ee93c474e2e15150eeeea2c7ef25230c158d63dea20bef41253b6d2ada9a90f182e011fc1bf4ebd'
            'a4004c2dd9adc28cdcdb0eaee95d40707a458c39dce72f64562079c9230bd7b48154593faa0fa03558d3efc661b16f10f745b30ac09be6d6ee78c4f6730b460f'
            '87aba35ac7592fdd370ffe8bbd90b0e0ee9b42c4f3ae8d3a5ced321eba6dbe3d0ef067b144e5173e3f72c73caf5ac97a6380d023400bd4a022c7a61afbb4637d')

package() {
  install -Dm755 "$srcdir/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
}
