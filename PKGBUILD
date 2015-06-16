# Maintainer: Sebastian Wilzbach <sebi at wilzbach dot me>
pkgname=screenchange-git
_pkgname=screenchange
pkgrel=1
pkgver=v8
pkgdesc="simplify access to xrandr and be able to quickly expand your desktop "
arch=('any')
url="https://github.com/greenify/screenchange"
license=('GPL3')
groups=()
depends=('xorg-xrandr' 'bash')
makedepends=('git')
optdepends=()
source=('git+https://github.com/greenify/screenchange.git')

package() {
  cd $_pkgname

  # binaries
  mkdir -p $pkgdir/usr/bin/
  cp screenchange $pkgdir/usr/bin

  # shared
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp README.md $pkgdir/usr/share/$_pkgname

}

pkgver() {
  cd $_pkgname
  echo "v"$(git rev-list --count master)
}

md5sums=('SKIP')

# vim:set ts=2 sw=2 et:
