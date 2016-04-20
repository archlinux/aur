# Maintainer: Tinxy <arch ät tinx døt eu>

pkgname=droopy-git
_pkgname=droopy
pkgver=135.fbe1ce5
pkgrel=1
pkgdesc="Mini Web server that let others upload files to your computer"
url='https://github.com/stackp/Droopy'
arch=('any')
license=('New BSD')
depends=('python')
conflicts=('droopy')
source=("${_pkgname}::git+https://github.com/stackp/Droopy.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  gzip --best man/droopy.1
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "$_pkgname" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "man/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
