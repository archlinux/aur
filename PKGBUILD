# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=2.2.4
pkgrel=1
pkgdesc='A powerful, lightning fast and censorship resistant proxy (Binary Release)'
arch=('x86_64')
url='https://hysteria.network/'
license=('MIT')
provides=('hysteria')
conflicts=('hysteria')
install=$_pkgbase.install
source=("$_pkgbase-$pkgver-$pkgrel-linux-amd64::https://github.com/apernet/hysteria/releases/download/app/v$pkgver/hysteria-linux-amd64"
        "$_pkgbase-$pkgver-$pkgrel-LICENSE.md::https://raw.githubusercontent.com/apernet/hysteria/app/v$pkgver/LICENSE.md"
        'hysteria@.service'
        'hysteria-server@.service'
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('2913882a96ba4ecdb7e504d260ca5a0b2d6c0a2d916f146156c54ea7447990a4'
            'b279cfdac4db4b077f0660b5d8156d50a8bc7bd410036dc356499af43c4e84f5'
            '7f67a976138c60741ebc0dc7ba4e8ad6d284cf45f130a435a5c65aa836446d05'
            '2142db7d6bfb7df5180357f5b4b25401cf3a788624c567e58fa3ecec00a58c75'
            '44f1cb2fedfc94dc396ceb215e62237dbc8c74c035c45a3430c1f3748d266dd9'
            '1e93d9f2b312eaf02ac00229106cd796e0cd54a9a468a0a8d3ae843399c1c310')

package() {
  install -Dm755 "$srcdir/$_pkgbase-$pkgver-$pkgrel-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/hysteria.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/hysteria.conf"
  install -Dm644 "$srcdir/hysteria@.service" "$pkgdir/usr/lib/systemd/system/hysteria@.service"
  install -Dm644 "$srcdir/hysteria-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria-server@.service"
  install -Dm644 "$srcdir/$_pkgbase-$pkgver-$pkgrel-LICENSE.md" "$pkgdir/usr/share/licenses/hysteria/LICENSE.md"
  install -dm755 "$pkgdir/etc/hysteria"
}
