# Maintainer: Jan0660 <jan0660@tutanota.com>

_pkgname='oh-my-posh'
pkgname="${_pkgname}-git"
pkgdesc="A prompt theme engine for any shell."

pkgver() {
  cd "oh-my-posh"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgver=r3180.030d52bd
pkgrel=1
pkgbase=oh-my-posh-git
replaces=()
arch=('x86_64')
url="https://github.com/JanDeDobbeleer/oh-my-posh"
license=('MIT')
groups=()
makedepends=('git' 'go>=1.21.0')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/JanDeDobbeleer/oh-my-posh.git')
sha256sums=('SKIP')

package() {
  cd "${srcdir}/oh-my-posh/src"
  go build -o ./oh-my-posh
  install -Dm 755 ./oh-my-posh -t "${pkgdir}/usr/bin/"
}
