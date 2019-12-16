# Maintainer: Tomasz Oponowicz <tomasz at zaxo dot biz>

pkgname=roombee-icon-theme-git
pkgver=20191216.r0.g0859d1d
pkgrel=1
epoch=1
pkgdesc="Roombee icon theme (git version)"
url="https://github.com/tomasz-oponowicz/${pkgname%-git}"
arch=('any')
license=('LGPL3')
makedepends=('git')
provides=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}
# vim:set ts=2 sw=2 et: