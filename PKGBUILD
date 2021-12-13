# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=0.9.0
pkgrel=1
pkgdesc='TCP relay & SOCKS5/HTTP proxy tool optimized for poor network environments (binary release)'
arch=('x86_64')
url='https://github.com/HyNetwork/hysteria'
license=('MIT')
provides=('hysteria')
conflicts=('hysteria')
source=("$_pkgbase-$pkgver-linux-amd64::https://github.com/HyNetwork/$_pkgbase/releases/download/v$pkgver/hysteria-linux-amd64"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf')

sha512sums=('d641a88fc7b133d1839f1f96fbef6e8695858b5f857a499ed4b412dda78ab51a963cd6995dd34d3ac1ec15ff7bb658471872683a71d0b67684352f36f55b1699'
            '32e38b0c77680bfac57ad10e2ec5f8057c81e1286c6dcd6a7ae110ce6956ca1e57fef00e5cbacff15e4b6f010029f7a0d68b62ed09c8cdbe1cba6485b900fe8c'
            'c042e08a22adaa18c1477dab5d44341bd54cc2a0baeaff5f7b615ffdf43aa663ebb7d22a88ef8178ef5c1aaa6b9e4538d8fa7277c65551aafd2d1f8de29d387b'
            '5a3927c7ae9d9dea619bd073eb666d52a454ed8a2af5d5cc95f0dd54a69d56731543b54c493bfd53e2d11a2395996df688f1126ddede977b4aa9ed4ee91011c5')

package() {
  install -Dm755 "$srcdir/$_pkgbase-$pkgver-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -dm755 "$pkgdir/etc/hysteria"
}
