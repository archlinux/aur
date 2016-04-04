# Maintainer: Quey-Liang Kao<s101062801@m101.nthu.edu.tw>
# Contributor: Eduardo Leggiero <https://www.leggiero.uk/>
# Contributor: Kai Korla <balticer@balticer.de>
# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Contributor: Ernie Brodeur <ebrodeur@ujami.net>

pkgname=gitflow
pkgver=1.9.1_dev
pkgrel=1
pkgdesc="A collection of git extetions for Vincent Driessen's branching model."
arch=('any')
url='https://github.com/petervanderdoes/gitflow-avh'
license=('BSD')
depends=('git')
source=("$pkgname.git::git://github.com/petervanderdoes/gitflow-avh.git")
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
