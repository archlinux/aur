# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Frank Carlyle McLaughlin <frank@frankspace.com>

pkgname=worker
pkgver=4.10.1
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('7132a93c2f10043604fa2634ddf2b2931d788629e33f7a448a185da93d3c5ce1f56034cbc3d474be6cf58435857b2e7bb820fa4eaac5382d6027b5c447c0fb95'
            'f0520b52a0b833c1995afd9416b0ad1cd623c000e1a60c56154f6540f4166a9df77a87529c0269b3abd37345a84cdf144fda15a6583a2a34ad5234c37c2ff28c')


validpgpkeys=('F9299EE90A729029E71AF26B667132D0FBC52B37') # Ralf Hoffmann


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --enable-xft --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
