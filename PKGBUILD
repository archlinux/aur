# Maintainer: Andy Kluger <https://t.me/andykluger>

_pkgname=zsh-z
pkgname=${_pkgname}-git
pkgver=220.e138de5
pkgrel=1
pkgdesc='Jump quickly to directories that you have visited "frecently." A native ZSH port of z.sh.'
arch=('any')
url='https://github.com/agkozak/zsh-z'
license=('MIT')
depends=('zsh')
makedepends=('git')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=('git+https://github.com/agkozak/zsh-z')
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Ddm755 "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
