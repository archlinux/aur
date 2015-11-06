# Contributor: Clément Guérin <geecko.dev@free.fr>

pkgname=mspgcc-binutils-bin
pkgver=20120406
pkgrel=1
pkgdesc="Binary utilities supporting TI's MSP430 targets"
arch=('i686' 'x86_64')
license=('GPL')
url="https://launchpad.net/ubuntu/+source/binutils-msp430"
depends=()

if [ "${CARCH}" = 'x86_64' ]; then
  s_arch='amd64'
  md5sums=('20cd42ff02091146f008fb33ab246dfe')
elif [ "${CARCH}" = 'i686' ]; then
  s_arch='i386'
  md5sums=('e8e2045ac7327b60b453e8f0b833efd2')
fi

source=("https://launchpad.net/ubuntu/+archive/primary/+files/binutils-msp430_2.22%7Emsp20120406-2_${s_arch}.deb")

package() {
  tar xzf ${srcdir}/data.tar.gz -C ${pkgdir}/
  msg2 "Cleaning up unwanted files..."
  rm -r "${pkgdir}"/{usr/share/doc,usr/share/lintian}
}


