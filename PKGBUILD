# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ex-impression-icon-theme-git
pkgver=r3.844323c
pkgrel=1
pkgdesc='This icon theme got inspired on Mac OS icons and mimics those for the Linux OS'
arch=('any')
url='https://github.com/balasakthi88/EX-Impression'
license=('GPL3')
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
makedepends=('git')
source=("ex-impression-icon-theme::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/EX-Impression"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/EX-Impression"
  rm *.md
  rm LICENSE
  rm -rf "theme extras"
  rm -rf .git
}

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -drf --no-preserve='ownership' . "${pkgdir}/usr/share/icons/"
}
# vim:set ts=2 sw=2 et: