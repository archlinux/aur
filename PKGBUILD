# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=wayfetch-git
_pkgname=wayfetch
pkgver=0.00.01.e9b0693d
pkgrel=1
pkgdesc="A CLI system information tool written in C. A neofetch clone."
arch=('x86_64')
url="https://github.com/PalanixYT/${_pkgname}"
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
  cd ${srcdir}/${_pkgname}
  make
}

package() {
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${_pkgname}/wayfetch" "${pkgdir}/opt/${_pkgname}/wayfetch"

  # links binary to /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/wayfetch "${pkgdir}/usr/bin"
}
