# Maintainer: Simon Paul <simonpaul at mailbox dot org>

pkgname=numix-themes-osx-git
pkgver=1.2.ea4c2bd
pkgrel=1
pkgdesc='A modified version of the Numix GTK theme modeled to look somewhat like OSX'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('numix-themes-osx-git')
conflicts=('numix-themes-osx-git')
source=('numix-themes-osx-git::git+https://github.com/samhorlbeck/Numix-OSX.git')
md5sums=('SKIP')

pkgver() {
  cd numix-themes-osx-git
  printf "1.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd numix-themes-osx-git
  install -dm 755 "${pkgdir}"/usr/share/themes/Numix-OSX
  rm -rf .git .gitignore
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-OSX/
}

# vim: ts=2 sw=2 et: