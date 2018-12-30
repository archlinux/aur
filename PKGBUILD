# Maintainer: Clar Fon <them@lightdark.xyz>

pkgname=zeyple
pkgver=1.2.2
pkgrel=2
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
            'e28eb51cd4da24785929f8de642443624dfb4b6ced4df7be714ad0a1b33327c909bbf8fd7aedbda0a3c151d17b306de3a19408d0f975f267228e87ae8c4d6800'
            'f1b8b2b20ae00dbdcba445d9e37a24455395a64124df33219c0cf37e5e13699d39d673ff17dc12c5a9808fca3fbdd5ce0a814bf29913d570bb56e7c77d77e59e')

package() {
  install -D -m700 -o726 -g726 -d "$pkgdir/var/lib/zeyple" "$pkgdir/var/lib/zeyple/keys"
  install -D -m744 -o726 -g726 "$srcdir/$pkgname-$pkgver/zeyple/zeyple.py" "$pkgdir/usr/bin/zeyple"
  install -D -m644 -o726 -g726 "$srcdir/$pkgname-$pkgver/zeyple/zeyple.conf.example" "$pkgdir/etc/zeyple.conf"
  install -D -m644 "$srcdir/zeyple.sysusers" "$pkgdir/usr/lib/sysusers.d/zeyple.conf"
}
