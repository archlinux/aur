# Maintainer: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>
pkgname=mkaur
pkgver=r255.71d9e9d
pkgrel=1
pkgdesc="Script that helps to automate creation AUR packages."
arch=('any')
url="https://github.com/crossroads1112/bin"
license=('GPL')
depends=('pkgbuild-introspection' 'pacman' 'bash' 'xdg-utils' 'coreutils')
optdepends=('aurploader: Upload package directly to AURv3' 'git: AURv4 upload support')
makedepends=('git')
source=(git+https://github.com/crossroads1112/bin.git)
md5sums=(SKIP)

pkgver() {
  cd "bin"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/bin"
  install -Dm0755 mkaur      "$pkgdir/usr/bin/mkaur"
}
