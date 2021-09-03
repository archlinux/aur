# Maintainer: Jan0660 <jan0660@tutanota.com>

pkgname=oh-my-posh-git
pkgdesc="A prompt theme engine for any shell."

pkgver() {
  cd "oh-my-posh"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r743.817725f
pkgrel=1
pkgbase=oh-my-posh-git
replaces=()
arch=('x86_64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('GPLv3')
groups=()
makedepends=('git' 'go')
depends=()
# provides=('oh-my-posh')
source=('git+https://github.com/JanDeDobbeleer/oh-my-posh.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/oh-my-posh/src"
  go build
  install -Dm 755 ./oh-my-posh -t "${pkgdir}/usr/bin/"
}
