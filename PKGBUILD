# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
# Previous maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=vim-crystal-git
pkgver=r341.dc21188
pkgrel=1
pkgdesc='vim support for Crystal programming language'
arch=(any)
url='https://github.com/rhysd/vim-crystal'
license=(MIT)
makedepends=(git)
source=('git+https://github.com/rhysd/vim-crystal.git')
sha1sums=('SKIP')

pkgver() {
  cd vim-crystal
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  install -d "$pkgdir/usr/share/vim/vimfiles"
  cp -r vim-crystal/{ftdetect,ftplugin,indent,syntax} "$pkgdir/usr/share/vim/vimfiles/"
  install -Dm644 vim-crystal/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
