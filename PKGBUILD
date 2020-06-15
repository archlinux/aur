# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=djvupages
pkgname=${_pkgname}-git
pkgver=r5.3b9ab4f
pkgrel=2
pkgdesc='Shell utility to manipulate pages of a DjVu file'
arch=('any')
url='https://github.com/ashipunov/djvupages'
license=('custom: public domain')
depends=('djvulibre' 'img2djvu-git')
makedepends=('git')
optdepends=('gimp: edit in gimp'
            'imagemagick: convert pages')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
}

# vim: ts=2 sw=2 et: