# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

_pkgname=bash-complete-more
pkgname=${_pkgname}-git
pkgver=r2.b9d1fa4
pkgrel=1
pkgdesc="More bash completion scripts"
arch=('any')
url="https://github.com/arthurzam/${_pkgname}"
license=('GPL2')
depends=('bash-completion')
source=("${_pkgname}::git+git://github.com/arthurzam/${_pkgname}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  for f in *; do
    install -Dm 755 $f "$pkgdir/usr/share/bash-completion/completions/$f"
  done
}

