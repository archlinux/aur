# Maintainer: Uffe Jakobsen <_ microtop _at_ starion.dk _>

pkgname=c64tapedecode-svn
pkgver=0.r69
pkgrel=1
pkgdesc="Commodore C64 Datasette tape utilities for tape preservation and restoration"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/c64tapedecode/"
license=('GPL-2.0-only')
_pkgname=c64tapedecode
_pkgver="src"
depends=('glibc')
conflicts=("c64tapedecode")
source=("${_pkgname}::svn+https://svn.code.sf.net/p/c64tapedecode/code/trunk")

md5sums=('SKIP')


pkgver()
{
  cd "${srcdir}/${_pkgname}/src"
  local ver="$(svnversion)"
  printf "0.r%s" "${ver//[[:alpha:]]}"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_pkgname}/src"
  make CFLAGS+=
}

package()
{
  cd "${srcdir}/${_pkgname}/src"
  install -D --mode=0755 c64tapedecode "${pkgdir}/usr/bin/c64tapedecode"
  install -D --mode=0755 wav2tap "${pkgdir}/usr/bin/wav2tap"
  install -D --mode=0755 tap2wav "${pkgdir}/usr/bin/tap2wav"
  install -D --mode=0755 tap2tap "${pkgdir}/usr/bin/tap2tap"
  install -D --mode=0755 taphist "${pkgdir}/usr/bin/taphist"
  install -D --mode=0755 mktap "${pkgdir}/usr/bin/mk2tap"
}

# EOF
