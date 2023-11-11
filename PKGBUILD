# Maintainer: Haruue Icymoon <i@haruue.moe>
# Contributor: 4679 <4679 at pm dot me>

_pkgbase=hysteria1
pkgname=$_pkgbase-bin
pkgver=1.3.5
pkgrel=2
pkgdesc='A feature-packed network utility optimized for networks of poor quality (Binary Release) (Legacy Version)'
arch=('x86_64')
url='https://v1.hysteria.network/'
license=('GPL3')
provides=('hysteria1')
conflicts=('hysteria1')
install=$_pkgbase.install
source=("$_pkgbase-$pkgver-$pkgrel-linux-amd64::https://github.com/apernet/hysteria/releases/download/v$pkgver/hysteria-linux-amd64"
        'hysteria1@.service'
        'hysteria1-server@.service'
        'sysusers.conf'
        'tmpfiles.conf')
sha256sums=('41dc8bc3fff6fc1f031666eb294f10b481b80b66229d7c6aca88398d0fba839d'
            '4ebeed6fb5f0416470094557f2321a0a604f55953242bc6b2b184198cc9085dc'
            '59d9d1b722028b66028565d269fd5028577fc0cab80f514232b5e8fb919c6ffe'
            '44f1cb2fedfc94dc396ceb215e62237dbc8c74c035c45a3430c1f3748d266dd9'
            '1e93d9f2b312eaf02ac00229106cd796e0cd54a9a468a0a8d3ae843399c1c310')

package() {
  install -Dm755 "$srcdir/$_pkgbase-$pkgver-$pkgrel-linux-amd64" "${pkgdir}/usr/bin/${_pkgbase}"
  install -Dm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/${_pkgbase}.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/${_pkgbase}.conf"
  install -Dm644 "$srcdir/hysteria1@.service" "$pkgdir/usr/lib/systemd/system/hysteria1@.service"
  install -Dm644 "$srcdir/hysteria1-server@.service" "$pkgdir/usr/lib/systemd/system/hysteria1-server@.service"
  install -dm755 "$pkgdir/etc/hysteria"
}
