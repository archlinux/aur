# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Jan Pacner
# Contributor: dumblob <dumblob@gmail.com>

pkgname=packer-aur-git
pkgver=325.400c655
pkgrel=2
pkgdesc='Bash wrapper for pacman and aur'
arch=('any')
url="https://github.com/gavinhungry/packer"
license=('GPL3')
depends=('bash' 'curl' 'grep' 'pacman' 'sed' 'jshon')
makedepends=('git')
conflicts=('packer')
source=("${pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${pkgname}"

  install -Dm755 packer "${pkgdir}"/usr/bin/packer-aur
  install -Dm644 packer.8 "${pkgdir}"/usr/share/man/man8/packer-aur.8
}
