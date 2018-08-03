# Maintainer: Javier Tia <javier[dot]tia[at]gmail[dot]com>

_pkgname=vet
pkgname=vet-bin
pkgver=3.19
pkgrel=1
pkgdesc='Gerrit client using pull request workflow'
url='https://github.com/Cosium/vet'
arch=('x86_64')
license=('MIT')
depends=('glibc')
source=("${url}/releases/download/${pkgver}/${_pkgname}-linux_x64.deb.zip")
sha256sums=('f4e810b9d87679be235c6e8ddfd7b77a2cac6cb69bb991997f2cc5f213036e81')

package() {
  ar x "${_pkgname}".deb
  tar xf data.tar.xz --no-same-permissions --no-overwrite-dir -C "${pkgdir}"

  # Clean up
  mv "${pkgdir}/usr/local/lib" "${pkgdir}/usr"
  mv "${pkgdir}/usr/local/bin" "${pkgdir}/usr"
  rmdir "${pkgdir}/usr/local"
}

# vim:set ft=sh ts=2 sw=2 et:
