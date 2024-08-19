# Maintainer: tyyip0 <tyyip0@proton.me>

_pkgname=zsh-auto-venv
pkgname=${_pkgname}-git
pkgver=r8.1cc8385
pkgrel=1
pkgdesc='Automatically activates the Python virtual environment in the current directory or its parent directories.'
arch=('any')
url='https://github.com/Skylor-Tang/auto-venv'
license=('MIT')
depends=('zsh')
makedepends=('git')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -Ddm755 "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  cp -r "${srcdir}/${_pkgname}"/* "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
