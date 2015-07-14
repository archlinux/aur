# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=vim-detectindent-git
pkgver=0.r20.c6f6e7b
pkgrel=1
pkgdesc="Vim script for automatically detecting indent setting"
arch=('any')
url="http://github.com/ciaranm/detectindent"
license=('custom:vim')
groups=('vim-plugins')
conflicts=('vim-detectindent')
depends=('vim')
makedepends=('git')
source=('detectindent::git+https://github.com/ciaranm/detectindent.git'
        license.txt)
md5sums=('SKIP'
         'b779e18be6ed77facc770691c967b8f8')

pkgver() {
  cd "detectindent"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "detectindent"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d "$_installpath"
  cp -R * "$_installpath"
  install -Dm644 "${srcdir}"/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
