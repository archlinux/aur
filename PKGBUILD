# Contributor: Ildar Sagdejev <specious@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

_pkgname=polyglot
pkgname="${_pkgname}-translate-git"
pkgver=r9.ab8f2f5
pkgrel=1
pkgdesc='Translate text to multiple languages simultaneously (latest git)'
arch=('any')
url="https://github.com/specious/${_pkgname}"
license=('ISC')
depends=('bash' 'translate-shell')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 ${_pkgname} -t "${pkgdir}/usr/bin/"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
