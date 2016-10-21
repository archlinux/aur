# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
pkgname=mkinitcpio-ppp
pkgver=0.0.4
pkgrel=3
pkgdesc="PPP hook for dialing to a ppp connection inside the initrd. In combination with dropbear_initrd_encrypt, it allows remote unlocking over the internet"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-ppp"
license=('BSD')
depends=('ppp')
#install=$pkgname.install
source=('ChangeLog' ${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz)
changelog='ChangeLog'
sha256sums=('89fdfe80ec692aa671f55abd9d141643bd3039fbc153a10fbd296dbd97790a7a'
            'e5fdada28323950bcecf5322734d5a3dfde59edef059a890fedd15d9f5bdd666')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/ppp_hook"      "$pkgdir/usr/lib/initcpio/hooks/ppp"
  install -Dm644 "$srcdir/$pkgname-$pkgver/ppp_install"   "$pkgdir/usr/lib/initcpio/install/ppp"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
