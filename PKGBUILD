# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>

pkgname=mkinitcpio-modconf-hook-git
_pkgname=mkinitcpio-modconf-hook

pkgver=20200403.6ce266e
pkgrel=1

url="https://github.com/Aetf/mkinitcpio-modconf-hook"
arch=('any')
license=('Apache')
pkgdesc="Pacman hook to run mkinitcpio after updates to packaged modprobe.d config files"

depends=('mkinitcpio')
makedepends=('git')

provides=("$_pkgname")

source=("git+https://github.com/Aetf/$_pkgname")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git log -1 --format=%cd.%h --date=short|tr -d -
}

package() {
  cd "$srcdir"/"$_pkgname"
  install -Dm644 90-modconf-update.hook "${pkgdir}"/usr/share/libalpm/hooks/90-modconf-update.hook
}
