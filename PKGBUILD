# Maintainer: ShadowKyogre <shadowkyogre.public@gmail. com>

pkgname=zsh-directory-history-git
_pkgname=zsh-directory-history
pkgver=r83.e6c8f30
pkgrel=1
pkgdesc="Per directory history plugin for zsh"
arch=('any')
url="https://github.com/karto/zsh-directory-history"
license=('BSD')
depends=('zsh' 'python')
makedepends=('git')
provides=('zsh-directory-history')
conflicts=('zsh-directory-history')
install="${pkgname}.install"
source=(${pkgname}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -d -m755 "$pkgdir/usr/share/zsh/plugins/$_pkgname"
  install -d -m755 "$pkgdir/usr/bin"
  install -m755 dirhist "$pkgdir/usr/bin"
  install -Tm644 "$_pkgname.plugin.zsh" "$pkgdir/usr/share/zsh/plugins/$_pkgname/$_pkgname.zsh"
  install -m644 README.md "$pkgdir/usr/share/zsh/plugins/$_pkgname"
}

# vim:set ts=2 sw=2 et:

