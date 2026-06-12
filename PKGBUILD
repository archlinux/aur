# Maintainer: kusanaginoturugi <kusanaginoturugi(at)gmail.com>
# Contributor: orumin <dev@orum.in>

pkgname=ttf-kazesawa-git
_gitname=kazesawa
pkgver=alpha.v1.r15.g3789e6d
pkgrel=3
pkgdesc="Japanese TrueType font obtained by mixing M+ and Source Sans Pro"
arch=('any')
url="https://github.com/kazesawa/kazesawa"
license=('OFL-1.1')
makedepends=('git')
provides=('ttf-kazesawa')
conflicts=('ttf-kazesawa')
source=('git+https://github.com/kazesawa/kazesawa.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF" out/*.ttf
  install -Dm644 LICENSE.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
