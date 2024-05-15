# Maintainer: Uffe Jakobsen <_ microtop _at_ starion.dk _>

pkgname=tapclean-git
pkgver=r1153.0c326a4
pkgrel=1
pkgdesc="Commodore tape preservation and restoration tool"
arch=('i686' 'x86_64')
url="https://tapclean.sourceforge.io/"
license=('GPL-2.0-only')
_pkgname=tapclean
_pkgver="src"
depends=()
conflicts=("tapclean")
source=("${_pkgname}::git+https://git.code.sf.net/p/tapclean/gitcode")

md5sums=('SKIP')


pkgver()
{
  cd "${srcdir}/${_pkgname}/src"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}/src"
  make CFLAGS+=
}

package()
{
  cd "${srcdir}/${_pkgname}/src"
  install -D --mode=0755 tapclean "${pkgdir}/usr/bin/tapclean"
}

# EOF
