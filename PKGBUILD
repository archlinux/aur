# Maintainer: Jan0660 <jan0660@tutanota.com>

_pkgname='oh-my-posh'
pkgname="${_pkgname}-git"
pkgdesc="A prompt theme engine for any shell."

pkgver() {
  cd "oh-my-posh"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r2061.ac665b65
pkgrel=1
pkgbase=oh-my-posh-git
replaces=()
arch=('x86_64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('GPLv3')
groups=()
makedepends=('git' 'go')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/JanDeDobbeleer/oh-my-posh.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/oh-my-posh/src"
  go build
  install -Dm 755 ./oh-my-posh -t "${pkgdir}/usr/bin/"
}
