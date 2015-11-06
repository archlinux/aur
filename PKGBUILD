# Contributor: Clément Guérin <geecko.dev@free.fr>

pkgname=mspgcc-gcc-bin
pkgver=20120406
pkgrel=1
pkgdesc="GNU C compiler (cross compiler for MSP430)"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/ubuntu/+source/gcc-msp430"
depends=('mspgcc-binutils-bin')
options=('libtool' 'staticlibs' '!strip')

if [ "${CARCH}" = 'x86_64' ]; then
  s_arch='amd64'
  md5sums=('8811318507221d8afa21aa1a0b2d75d9')
elif [ "${CARCH}" = 'i686' ]; then
  s_arch='i386'
  md5sums=('9b6ae55a78cefc58e71515484a160485')
fi

source=("https://launchpad.net/ubuntu/+archive/primary/+files/gcc-msp430_4.6.3%7Emspgcc-20120406-5_${s_arch}.deb")

package() {
  tar xzf ${srcdir}/data.tar.gz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -r "${pkgdir}"/{usr/share/doc,usr/share/locale}
}


