# Maintainer: Pierre-Marie de Rodat <pmderodat@kawie.fr>
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=libgpr
pkgver=1
pkgrel=3
pkgdesc="Ada library to handle GPRbuild project files"

arch=('i686' 'x86_64')
url="http://www.adacore.com/gnatpro/toolsuite/gprbuild"
license=('GPL')

depends=('gcc-ada' 'gcc-libs')
makedepends=('git' 'gcc-ada' 'gprbuild')

source=('http://mirrors.cdn.adacore.com/art/591c45e2c7a447af2deecff7')
sha1sums=('f956aa57c58c342a958332c8cd98e6481e9ce593')


library_kinds="static shared"


build() {
  cd "$srcdir/gprbuild-gpl-2017-src"

  for k in $library_kinds
  do
    make libgpr.build.$k
  done
}


package() {
  cd "$srcdir/gprbuild-gpl-2017-src"

  for k in $library_kinds
  do
    make libgpr.install.$k "prefix=$pkgdir/usr"
  done
}
