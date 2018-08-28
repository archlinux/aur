# Maintainer: Jason Stryker <inbox at jasonstryker dot com>

pkgname=protontricks-git
pkgver=0.r14.c219cd2
pkgrel=1
pkgdesc="A simple wrapper that does winetricks things for Proton enabled games."
arch=('any')
url="https://github.com/Sirmentio/protontricks"
license=('GPL3')
depends=('python' 'winetricks')
makedepends=('git')
source=("git+https://github.com/Sirmentio/protontricks.git")
sha256sums=('SKIP')

pkgver() {
  cd protontricks
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd protontricks

  install -D -m 0755 protontricks "${pkgdir}/usr/bin/protontricks"

  install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
