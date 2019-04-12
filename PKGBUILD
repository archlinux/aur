# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=mkinitcpio-tor
pkgver=0.0.1
pkgrel=1
pkgdesc="Arch Linux mkinitcpio hook for running tor on the initramfs"
arch=('any')
url="https://github.com/grazzolini/mkinitcpio-tor"
license=('BSD')
depends=('tor')
optdepends=('mkinitcpio-netconf: Network interface configuration'
            'mkinitcpio-tinyssh: For remote unlocking using tinyssh'
            'mkinitcpio-dropbear: For remote unlocking using dropbear')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c87d27091b96bdb45834f8948cddf902a0f07b4a93f32abacb59d5e95b61777994e9295d812026d39248d07eede52a6a03e41e7171247e26d63202e41cf45126')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/tor_hook"      "$pkgdir/usr/lib/initcpio/hooks/tor"
  install -Dm644 "$srcdir/$pkgname-$pkgver/tor_install"   "$pkgdir/usr/lib/initcpio/install/tor"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
