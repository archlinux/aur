# Maintainer: Jae Lo Presti <me@jae.fi>

pkgname=exiftool-rs-git
_pkgname=exiftool-rs
pkgver=0.1.0.r4.g2c130d9
pkgrel=1
pkgdesc='Image metadata scrubber written in Rust.'
arch=('x86_64')
url='https://github.com/jae1911/exiftool-rs'
license=('MIT')
depends=('rust')
source=("git+https://github.com/jae1911/exiftool-rs.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  echo $(git describe --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

package() {
  cd "${srcdir}/${_pkgname}"

  CARGO_INSTALL_ROOT="${pkgdir}/usr" cargo install --path .

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
