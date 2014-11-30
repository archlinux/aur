# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=wordforge
pkgver=0.8rc1
pkgrel=1
pkgdesc="A user friendly translation program (CAT), that makes the translation process simpler"
arch=('any')
url="http://translate.sourceforge.net/wiki/wordforge/index"
license=('GPL')
depends=('python2-pyqt4' 'python2-pyenchant' 'translate-toolkit')
source=(http://downloads.sourceforge.net/wordforge2/wordforge-0.8-rc1.tar.gz)
md5sums=('91dffd250c3bf8351f4cf48f53eecb7c')

prepare() {
  cd "${srcdir}"/wordforge-0.8-rc1

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

package() {
  cd "${srcdir}"/wordforge-0.8-rc1

  python2 setup.py install --root="${pkgdir}"
}
