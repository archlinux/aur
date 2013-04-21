# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=antievilmaid-git
_gitname=antievilmaid
pkgver=31.414fd06
pkgrel=1
pkgdesc="Anti Evil Maid for initramfs-based systems."
arch=('i686' 'x86_64')
url="http://www.qubes-os.org"
license=('GPL')
depends=('antievilmaid-trustedgrub' 'parted')
optdepends=('dracut-antievilmaid-git: Dracut hook for Anti Evil Maid'
            'mkinitcpio-antievilmaid: mkinitcpio hook for Anti Evil Maid (recommended)')
makedepends=('git')
provides=('antievilmaid')
conflicts=('antievilmaid')
source=('git://git.qubes-os.org/joanna/antievilmaid.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd $_gitname
  install -d -m0755 "$pkgdir/usr/lib/antievilmaid"
  install -m0755 antievilmaid_install "$pkgdir/usr/lib/antievilmaid/"
  install -m0644 README "$pkgdir/usr/lib/antievilmaid/"
}

# vim:set ts=2 sw=2 et:
