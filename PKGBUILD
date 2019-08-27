# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=smtp-user-enum-git
_gitname='smtp-user-enum'
pkgver=r2.69eea42
pkgrel=1
pkgdesc=''
arch=(any)
url='https://github.com/pentestmonkey/smtp-user-enum'
license=(GPL)
depends=('perl')
conflicts=(smtp-user-enum)
provides=(smtp-user-enum)
source=("${_gitname}::git+https://github.com/pentestmonkey/smtp-user-enum.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}/${_gitname}"
  
  install -v -m755 -d "${pkgdir}/usr/bin"
  install -v -m755 -d "${pkgdir}/usr/share/doc/${_gitname}"
  install -v -m644 {README.md,LICENSE,smtp-user-enum-user-docs.pdf} "${pkgdir}/usr/share/doc/${_gitname}/"
  install -v -m755 ${_gitname}.pl "${pkgdir}/usr/bin/${_gitname}.pl"
}

# vim:set ts=2 sw=2 et:
