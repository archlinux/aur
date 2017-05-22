# Maintainer: ABDULLATIF Mouhamadi <bourou01dev@gmail.com>
pkgname=tinyos
pkgver=2.1.2
pkgrel=1
pkgdesc="Small operating system for sensor motes, embedded devices"
arch=(any)
license=(GPL)
options=(!libtool)
url="http://www.tinyos.net/"
depends=('glibc' 'nesc')
optdepends=('jdk: for building java tools for tinyos applications'
	    'jre: for using java tools'
	    'avr-libc-tinyos: to build for atmel based platforms'
	    'avrdude: to installing for atmel based platform (which is not supported by uisp, like iris)'
	    'binutils-msp430: to build for msp430 based platforms'
	    'gcc-msp430: to build for msp430 based platforms'
	    'msp430-libc: to build for msp430 based platforms')

source=(http://tinyos.stanford.edu/tinyos/dists/source/${pkgname}-${pkgver}.tar.gz
	tinyos.profile)
md5sums=('58c894214a353866a4a11774c3372dae'
	 '242f5d337860fd4f5c713bf39a5e5c1d')

package() {

  install -d ${pkgdir}/opt
  cp -aR ${srcdir}/${pkgname}-${pkgver}/ ${pkgdir}/opt
  install -D -m755 ${srcdir}/${pkgname}.profile ${pkgdir}/etc/profile.d/${pkgname}.sh
}
