# Maintainer: Jan Pacner
# Contributor: dumblob <dumblob@gmail.com>

pkgname=packer-git
pkgver=292.bc9976d
pkgrel=1
pkgdesc='Bash wrapper for pacman and aur'
url="https://github.com/gavinhungry/packer"
license=('GPL3')
arch=('any')
source=("$pkgname::git+https://github.com/gavinhungry/packer")
sha256sums=('SKIP')
# most of depends are not needed, they're present only for clarity
depends=('grep' 'sed' 'bash' 'curl' 'pacman' 'jshon')
makedepends=('git')
optdepends=('sudo: install and update packages as non-root'
            'customizepkg: apply customizepkg modifications')
provides=('packer')
conflicts=('packer')

build() {
  true
}

pkgver() {
  cd "$pkgname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  install -D -m 755 packer "$pkgdir/usr/bin/packer"
  install -D -m 644 packer.8 "$pkgdir/usr/share/man/man8/packer.8"
}
