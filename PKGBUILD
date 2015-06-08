# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: johnpatcher
# Contributor: chadversary
# Contributor: allspark
pkgname=dropbear_initrd_encrypt
pkgver=0.16
pkgrel=1
pkgdesc="Allows for an encrypted root device to be unlocked remotely over SSH"
arch=('any')
url="https://github.com/grazzolini/dropbear_initrd_encrypt"
license=('GPL3')
depends=('dropbear' 'cryptsetup' 'mkinitcpio-nfs-utils' 'psmisc' 'iproute2')
optdepends=('openssh: Allows the use of the same host keys used for normal access')
install=$pkgname.install
source=('ChangeLog' "$pkgname.install" $url/archive/v$pkgver-$pkgrel.tar.gz)
changelog='ChangeLog'
sha512sums=('73f14bca30ee87580b8a7cfcd7fa6b61170f30f3937026e67a72f2ed55479e104d249212d0867ff5cf06337f2b606c618e1df5addf98cab03510da3393ac9438'
            '190d624b6098661362ffdef13341030cb02c317135e742fa2e941939ed873f885f3deeb3361fad09163fec4dd580b06d57cc036df2391483bfab0a2076887cb2'
            '6e99563a4004d751bd7f4a3974432606f012074cf4ec3f21fd4c03bd5727bc968db1eac7441a2f5897eab8f84d7507111519a3bb736ff1b6e09c76aafa22462b')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/dropbear_hook"      "$pkgdir/usr/lib/initcpio/hooks/dropbear"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/dropbear_install"   "$pkgdir/usr/lib/initcpio/install/dropbear"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/encryptssh_hook"    "$pkgdir/usr/lib/initcpio/hooks/encryptssh"
  install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgrel/encryptssh_install" "$pkgdir/usr/lib/initcpio/install/encryptssh"
}
