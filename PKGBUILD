# Maintainer: seiuneko <chfsefefgesfen foxmail>

pkgname=zsh-zce-git
_pkgname=zce
__pkgname=${pkgname%-git}
pkgver=r21.ee71bfa
pkgrel=1
pkgdesc='zsh EasyMotion/ace-jump-mode'
url='https://github.com/hchbaw/zce.zsh'
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('zsh')
makedepends=('git')
arch=('x86_64')
source=("${pkgname}::git+${url}.git"
)
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"

  install -Dm0755 -t "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/" zce.zsh
  ln -s zce.zsh "${pkgdir}/usr/share/zsh/plugins/${_pkgname}/${_pkgname}.plugin.zsh"

  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${__pkgname}" COPYING
}
