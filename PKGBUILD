# Original Contributor: Vinzenz Vietzke <vinz@archlinux.us>
# Modified by: Farhan Yousasf <farhany@gmail.com>
# Modified by: c0mmando <c0mmand0_88@yahoo.com.ar>
# Maintainer: beest <gnubeest@gmail.com>

pkgname=atari800
pkgver=3.1.0
pkgrel=2
pkgdesc="An emulator of the Atari 800/800XL/130XE/5200 with various extensions"
arch=('i686' 'x86_64' 'armv6h')
url="http://atari800.sourceforge.net/"
license=('GPL2')
depends=('libpng' 'sdl')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('354f8756a7f33cf5b7a56377d1759e41')

build()
{
  # This emulator has a few linux compatible targets. Edit the target
  # and depends variables if you'd like a different target.
  # Valid choices are: default , android , falcon , javanvm , javanvm-basic , ps2 , windx , x11 
  # see -> ./configure --target --help
  #default=autodetect graphics and sound 
  _target=default
  
  # Pass the reponse to the configure script
  
  cd ${srcdir}/${pkgname}-${pkgver}/src
  ./configure --target=${_target} --prefix=/usr
  make
}

package() 
{
  cd ${srcdir}/${pkgname}-${pkgver}/src
  make DESTDIR=${pkgdir} install
}
