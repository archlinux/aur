# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="gws-git"
_pkgname="gws"
pkgver=0.1.4.r14.gb6c9766
pkgrel=1
pkgdesc="Colorful KISS helper for git workspaces"
url="https://github.com/StreakyCobra/gws"
license=('MIT')
arch=('any')
depends=('bash>4.0' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
changelog="ChangeLog"
source=("${_pkgname}::git+https://github.com/StreakyCobra/${_pkgname}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}/"

  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}/"

  install -D -m 755 'src/gws' "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m 755 'completions/zsh' "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -D -m 755 'completions/bash' "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
}

# vim:set ts=4 sw=4 et:
