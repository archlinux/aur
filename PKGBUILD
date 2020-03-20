# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Simon Paul <simonpaul at mailbox dot org>

pkgname=victory-icon-theme-git
pkgver=1.1.a8ce414
pkgrel=2
pkgdesc='Victory Icon Theme, A GTK Icon Theme for Linux'
arch=('any')
url='https://gitlab.com/newhoa/victory-icon-theme'
license=('GPL3')
makedepends=('git')
provides=('victory-icon-theme')
conflicts=('victory-icon-theme')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/victory-icon-theme"
  printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/victory-icon-theme"
  rm Changelog Credits GPL3 LICENSE README.md
  rm -rf Alts
  rm -rf .git
}

package() {
  cd "${srcdir}/victory-icon-theme"
  install -dm 755 "${pkgdir}"/usr/share/icons/Victory-Icon-Theme
  rm -rf .git .gitignore
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/icons/Victory-Icon-Theme/
}
# vim: ts=2 sw=2 et: