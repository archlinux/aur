# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=vim-crystal-git
pkgver=r19.04dae4f
pkgrel=1
pkgdesc='vim support for Crystal programming language'
arch=(any)
url='https://github.com/rhysd/vim-crystal'
license=(MIT)
makedepends=(git)
source=(git://github.com/rhysd/vim-crystal)
sha1sums=('SKIP')

pkgver() {
  cd vim-crystal
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -d "$pkgdir/usr/share/vim/vimfiles"
  cp -r vim-crystal/{ftdetect,ftplugin,indent,syntax} "$pkgdir/usr/share/vim/vimfiles/"
}
