# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=1.3.0
pkgrel=1
pkgdesc='A feature-packed network utility optimized for networks of poor quality (Binary Release)'
arch=('x86_64')
url='https://github.com/HyNetwork/hysteria'
license=('GPL3')
provides=('hysteria')
conflicts=('hysteria')
install=$_pkgbase.install
source=("$_pkgbase-$pkgver-$pkgrel-linux-amd64::https://github.com/HyNetwork/$_pkgbase/releases/download/v$pkgver/hysteria-linux-amd64"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('c711070151c0a0dc537d1860d34f76cfb47dbcb04ee22a7734004f081d9602f3'
            '61ef8c91f417d83411d89295495e0c926ded7ed02302e7a0efa123d564e12f7e'
            '5a0fb1185e7bff6e05ec8ecb8a45b269fd4c7fa562ab107954ab87642a71f8d0'
            '44f1cb2fedfc94dc396ceb215e62237dbc8c74c035c45a3430c1f3748d266dd9'
            '1e93d9f2b312eaf02ac00229106cd796e0cd54a9a468a0a8d3ae843399c1c310')

package() {
  install -Dm755 "$srcdir/$_pkgbase-$pkgver-$pkgrel-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -dm755 "$pkgdir/etc/hysteria"
}
