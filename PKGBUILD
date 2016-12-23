# Maintainer: Simon Paul <simonpaul at mailbox dot org>

pkgname=victory-icon-theme-git
pkgver=1.16.557592d
pkgrel=1
pkgdesc='A GTK icon theme for Linux by newhoa'
arch=('any')
url='https://github.com/newhoa/victory-icon-theme'
license=('GPL3')
depends=()
makedepends=('git')
provides=('victory-icon-theme-git')
conflicts=('victory-icon-theme-git')
source=('victory-icon-theme-git::git+https://github.com/newhoa/victory-icon-theme.git')
md5sums=('SKIP')

pkgver() {
  cd victory-icon-theme-git
  printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd victory-icon-theme-git
  install -dm 755 "${pkgdir}"/usr/share/icons/Victory-Icon-Theme
  rm -rf .git .gitignore
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/icons/Victory-Icon-Theme/
}

# vim: ts=2 sw=2 et:
