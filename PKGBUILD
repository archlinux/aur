# Maintainer:  kirill9617 <kirill9627@yandex.ru>

pkgname=vim_plugmanager
pkgver=97.367812f
pkgrel=1
pkgdesc="Vim plugins management by Delphinium"
arch=('any')
url="https://github.com/Bashka/$pkgname"
license=('GPL')
depends=('vim' 'vim_lib')
makedepends=('git')
install="${pkgname}.install"
source=("$pkgname::git+git://github.com/Bashka/${pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname
  mkdir -p "${pkgdir}/usr/share/vim/bundle/$pkgname"

  # We don't need anything related to git in the package.
  rm -rf .git*

  # Copy everything else.
  cp -r . "${pkgdir}/usr/share/vim/bundle/$pkgname"
}

# vim:set ts=2 sw=2 et:
