# Maintainer: Clar Fon <them@lightdark.xyz>

pkgname=zeyple
pkgver=1.2.2
pkgrel=1
pkgdesc="Zeyple is a Postfix filter/hook to automatically encrypt outgoing emails with GPG/PGP"
arch=('any')
url="https://github.com/infertux/zeyple"
license=('AGPL3')
depends=('gnupg' 'python-gpgme')
install="zeyple.install"
source=("https://github.com/infertux/zeyple/archive/v$pkgver.tar.gz"
        "zeyple.sysusers"
        "zeyple.install")
sha512sums=('76ae94af969b780ca1085abeb7c815f59d74701d4837fd39af8152ef98bddb5dc10ee137fc303e29202ca26efee0d0c76ffc0633ac14437648c0be3b472eebb7'
            '0db8b837236308fb0da18b5739fb00e64c0858b6a97fb66e605c07c8bb21ebc76c5fa294564af796195faea02177c991b9700db8e92853752110ca119f9e4243'
            'e7fa247c07731da1df4e3476aefaec228d86389476b2272e688a651cad3b492b2dbd17d56e9c2e5014fda111abad7def1f340b2b2b25eaaba98699be9c412c4b')

package() {
  install -D -m700 -d "$pkgdir/var/lib/zeyple" "$pkgdir/var/lib/zeyple/keys"
  install -D -m744 "$srcdir/$pkgname-$pkgver/zeyple/zeyple.py" "$pkgdir/usr/bin/zeyple"
  install -D -m644 "$srcdir/$pkgname-$pkgver/zeyple/zeyple.conf.example" "$pkgdir/etc/zeyple.conf"
  install -D -m644 "$srcdir/zeyple.sysusers" "$pkgdir/usr/lib/sysusers.d/zeyple.conf"
}
