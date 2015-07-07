# Maintainer: fsckd <fsckdaemon at gmail dot com>

pkgname=taipan
pkgver=0.9
pkgrel=1
pkgdesc="Ncurses port of Art Canfil's classic Apple ][ game of China trade during the 1800's."
url='http://www.ibiblio.org/pub/linux/games/textrpg/taipan-0.9.lsm'
license=('GPL')
arch=('i686' 'x86_64')
depends=('ncurses')
source=("http://www.ibiblio.org/pub/linux/games/textrpg/taipan-0.9.tar.gz")
sha256sums=('d51345e0e0aa599357fe7b8cb79f3f7109a78c15b852ba8a712f65701d7d5861')

build()
{
   cd "${srcdir}/taipan-0.9"
   make clean
   make
}

package()
{
   local tardir="${srcdir}/taipan-0.9"
   install -D -m0755 "${tardir}/taipan" "${pkgdir}/usr/bin/taipan"
   install -D -m0644 "${tardir}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# TODO patch author's current email
