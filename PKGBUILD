# Maintainer: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=0.8.1
pkgrel=1
pkgdesc='TCP relay & SOCKS5/HTTP proxy tool optimized for poor network environments (binary release)'
arch=('x86_64')
url='https://github.com/HyNetwork/hysteria'
license=('MIT')
provides=('hysteria')
conflicts=('hysteria')
source=("$_pkgbase::https://github.com/HyNetwork/$_pkgbase/releases/download/v$pkgver/hysteria-linux-amd64"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf')

sha512sums=('47e34fb6713a02167e925cce570105a42a38197774f14ab7e22b081c6f0cdfb355417b14625e1c7c9a4ecce0ffca1a392a8dd7521831d17c0111bcb6db90730d'
            'd1d13fc53943dd3caadec1b2882188457eef914e5b54cf5f532e04f94119f2227737a24a751dbcd7aa65c5fd051bbe1ba2c79983c6e5ae189df0f541130e68de'
            'c43f7de39624a6e7e7910280d16d5675660f2a49e430b050ebbb8415f8d3bed491f959126917e096aa9de180f9c5ffd62c8c74c9c0ac944dc3c0eba39e9c48f4'
            '5a3927c7ae9d9dea619bd073eb666d52a454ed8a2af5d5cc95f0dd54a69d56731543b54c493bfd53e2d11a2395996df688f1126ddede977b4aa9ed4ee91011c5')

package() {
  install -Dm755 "$srcdir/${_pkgbase}" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -dm755 "$pkgdir/etc/hysteria"
}
