# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=aurrpkgs-git
pkgver=r8.86048fb
pkgrel=2
pkgdesc="Manage AUR R packages "
arch=(any)
license=('GPL3')
url="https://github.com/dvdesolve/aurrpkgs"
depends=('python>=3.2.0')
makedepends=('git')
provides=('aurrpkgs')
conflicts=('aurrpkgs')
source=("$pkgname::git+https://github.com/dvdesolve/aurrpkgs.git")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  install -Dm755 aurrpkgs.py "${pkgdir}/usr/bin/aurrpkgs"
}
