# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=mkinitcpio-antievilmaid
pkgver=0.1
pkgrel=3
pkgdesc="mkinitcpio hook to enable Anti Evil Maid support."
arch=('i686' 'x86_64')
url="https://github.com/mutantmonkey/mkinitcpio-antievilmaid"
license=('GPL')
depends=('mkinitcpio' 'trousers')
optdepends=("antievilmaid: Anti Evil Maid installation script")
source=('git+https://github.com/mutantmonkey/mkinitcpio-antievilmaid.git')
sha256sums=('SKIP')

package() {
  cd "$srcdir/mkinitcpio-antievilmaid"
  install -Dm644 install_antievilmaid \
    "${pkgdir}/usr/lib/initcpio/install/antievilmaid"
  install -Dm644 hook_antievilmaid \
    "${pkgdir}/usr/lib/initcpio/hooks/antievilmaid"
  install -Dm644 69-anti-evil-maid.rules \
    "${pkgdir}/usr/lib/initcpio/udev/69-anti-evil-maid.rules"
  install -Dm644 hosts "${pkgdir}/usr/lib/initcpio/antievilmaid/hosts"
  install -Dm644 passwd "${pkgdir}/usr/lib/initcpio/antievilmaid/passwd"
  install -Dm644 shadow "${pkgdir}/usr/lib/initcpio/antievilmaid/shadow"
}

# vim:set ts=2 sw=2 et:
