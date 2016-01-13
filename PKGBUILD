# Maintainer: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Kai Korla <balticer@balticer.de>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Ernie Brodeur <ebrodeur@ujami.net>

pkgname=gitflow
pkgver=0.4.1
pkgrel=5
pkgdesc='Extend git with the Gitflow branching model.'
arch=('any')
url='https://github.com/nvie/gitflow'
license=('BSD')
depends=('git')
source=("$pkgname.git::git://github.com/nvie/gitflow.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cd $srcdir/${pkgname}.git
  git submodule init
  git submodule update
}

package() {
  cd $srcdir/${pkgname}.git
  make install prefix=$pkgdir/usr
}
