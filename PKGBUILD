# Contributor: Clément Guérin <geecko.dev@free.fr>

pkgname=mspgcc-libc-bin
pkgver=20120224
pkgrel=1
pkgdesc="Standard C library for TI MSP430 development"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/ubuntu/+source/msp430-libc"
depends=('mspgcc-gcc-bin' 'mspgcc-binutils-bin')
options=('libtool' 'staticlibs' '!strip')

if [ "${CARCH}" = 'x86_64' ]; then
  s_arch='amd64'
  md5sums=('95fc5d54d47030ce8d88ba99fc2f2b30')
elif [ "${CARCH}" = 'i686' ]; then
  s_arch='i386'
  md5sums=('a0d9a9a9de9188c15a8c5a22a4f6176a')
fi

source=("https://launchpad.net/ubuntu/+archive/primary/+files/msp430-libc_20120224-1_${s_arch}.deb")

package() {
  tar xzf ${srcdir}/data.tar.gz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -r "${pkgdir}"/{usr/share/doc,usr/share/lintian}
}


