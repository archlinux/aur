# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=img2djvu-git
pkgver=22.0cea05f
pkgrel=1
pkgdesc="Single-pass DjVu encoder based on DjVu Libre and ImageMagick"
arch=('any')
url="https://github.com/ashipunov/img2djvu"
license=('custom: Public domain')
depends=('djvulibre' 'imagemagick')
# Dependency 'bash' provides by 'djvulibre'
makedepends=('git')
source=('git+git://github.com/ashipunov/img2djvu.git')
md5sums=('SKIP')

_gitname='img2djvu'

pkgver() {
  cd ${srcdir}/${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${_gitname}"

  install -D -m755 "${_gitname}" "${pkgdir}/usr/bin/${_gitname}"

  install -dm755 "${pkgdir}/usr/share/doc/${_gitname}"
  install -D -m644 NEWS README TODO "${pkgdir}/usr/share/doc/${_gitname}"
} 

# vim:set ts=2 sw=2 et:
