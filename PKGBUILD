# Maintainer: kpcyrd <kpcyrd[at]archlinux[dot]org>
# Contributors: Morten Linderud <foxboron@archlinux.org>
# Contributors: Jelle van der Waa <jelle@archlinux.org>

pkgname=aur-repro
pkgver=0.0.0
# aur-repro itself does not work well on -git packages, so we pretend to be a non-git one
_commit=b30ddcbdec3d95d48f1a86fa89fa28d676eda46b
pkgrel=1
pkgdesc='Reproducible Builds for packages in the Arch User Repository (AUR)'
arch=('any')
license=('MIT')
makedepends=('git' 'asciidoc')
depends=('diffoscope' 'curl' 'gnupg' 'git' 'diffutils' 'zstd')
url="https://github.com/kpcyrd/aur-repro"
source=("git+https://github.com/kpcyrd/${pkgname}.git#commit=${_commit}")
sha256sums=('SKIP')

build(){
  cd "${pkgname}"
  make TAG="${pkgver}"
}

package() {
  cd "${pkgname}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
