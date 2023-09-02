# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

pkgname=hysteria-bin
_pkgbase=hysteria
pkgver=2.0.0
pkgrel=1
pkgdesc='A feature-packed network utility optimized for networks of poor quality (Binary Release)'
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
sha256sums=('13c073e6c98cacda2492faa1edb997a30282b57b99429d9f4b25530bdf23f04f'
            'b279cfdac4db4b077f0660b5d8156d50a8bc7bd410036dc356499af43c4e84f5'
            '5d421ca1e73c69317261afd6405f3759c47fd2a3c69674cbbadf80bd433bd4db'
            '98b7a3bcfe9278f196ff922b31d4b5363fd83d42e9dbd4a813e093a4d429511a'
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
