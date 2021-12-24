# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=0.9.2
pkgrel=1
pkgdesc='TCP relay & SOCKS5/HTTP proxy tool optimized for poor network environments (binary release)'
arch=('x86_64')
url='https://github.com/HyNetwork/hysteria'
license=('MIT')
depends=('glibc')
provides=('hysteria')
conflicts=('hysteria')
source=("$_pkgbase-$pkgver-linux-amd64::https://github.com/HyNetwork/$_pkgbase/releases/download/v$pkgver/hysteria-linux-amd64"
        "$_pkgbase-mit-license::https://raw.githubusercontent.com/HyNetwork/hysteria/01c7d18/LICENSE.md"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf')
sha512sums=('3b17c35beaa2ce17b4bffade6c06a76aa3c5098633a5cc86578d7ef8a9507f6416ff01d3676d3832d1ddec8b3691b06c4120edf7b72c785e47ccee82c9900987'
            '4ecdd96d167c3b50b6fe6a231dab358efc60213885253947d3432fad52d3e67c17460235f0145c5c44a3dcf9c48e116d9c147af5b57e1d09e90b4d80fb6c7a0e'
            '5e04b55449b47e001002b4010a6dbcd3f0a71860774029cfeb1ce0b073d2f8c8aea3f9f93f5635c22790777ef8b907756b380ed5281fb26b98f9cef4a950df89'
            'aa35d93e8e8481f0adcc644570c5952be41bcb54e8e6ff3514d3831b96e17141f017c76d20a37e3efa231a948177bb1bb16d10ab4255d6350559285563731049'
            '5a3927c7ae9d9dea619bd073eb666d52a454ed8a2af5d5cc95f0dd54a69d56731543b54c493bfd53e2d11a2395996df688f1126ddede977b4aa9ed4ee91011c5')

package() {
  install -Dm755 "$srcdir/$_pkgbase-$pkgver-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -Dm644 "$srcdir/$_pkgbase-mit-license" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -dm755 "$pkgdir/etc/hysteria"
}
