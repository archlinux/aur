# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=1.0.1
pkgrel=1
pkgdesc='A feature-packed network utility optimized for networks of poor quality (Binary Release)'
arch=('x86_64')
url='https://github.com/HyNetwork/hysteria'
license=('MIT')
depends=('glibc')
provides=('hysteria')
conflicts=('hysteria')
source=("$_pkgbase-tun-$pkgver-linux-amd64::https://github.com/HyNetwork/$_pkgbase/releases/download/v$pkgver/hysteria-tun-linux-amd64"
        "$_pkgbase-mit-license::https://raw.githubusercontent.com/HyNetwork/hysteria/01c7d18/LICENSE.md"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf')
sha512sums=('4bedf459d09b04890a6ce018febc590c24096c1c9b37d04abe16da21b6e8797f421b704e8f15efdb2ba959f9e893536a1d04fcbccf5901dad799238809c29b51'
            '4ecdd96d167c3b50b6fe6a231dab358efc60213885253947d3432fad52d3e67c17460235f0145c5c44a3dcf9c48e116d9c147af5b57e1d09e90b4d80fb6c7a0e'
            '5e04b55449b47e001002b4010a6dbcd3f0a71860774029cfeb1ce0b073d2f8c8aea3f9f93f5635c22790777ef8b907756b380ed5281fb26b98f9cef4a950df89'
            '2402608e64e0995fe0c983e32cd7299fb5a494a16dc8bd9609dab458ca31d38bec0e252462e6ed5efdf7159c5bae56762044091394dbb9b00df71b2305f05727'
            '5a3927c7ae9d9dea619bd073eb666d52a454ed8a2af5d5cc95f0dd54a69d56731543b54c493bfd53e2d11a2395996df688f1126ddede977b4aa9ed4ee91011c5')

package() {
  install -Dm755 "$srcdir/$_pkgbase-tun-$pkgver-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -Dm644 "$srcdir/$_pkgbase-mit-license" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  install -dm755 "$pkgdir/etc/hysteria"
}
