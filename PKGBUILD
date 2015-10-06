# Mantainer: MCMic <come@chilliet.eu>

pkgname=olliolli-hib
pkgver=1414459118
pkgrel=1
pkgdesc="2D skateboard plateformer"
arch=('i686' 'x86_64')
url="http://www.roll7.co.uk/#!olliolli/c1ic0"
license=('Commercial')
depends=()
makedepends=(hib-dlagent sed)
source=("hib://olliolli_linux_${pkgver}.tar.bz2")
md5sums=('8a652f2dba35688b52b5272e90855960')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in makepkg.conf. See http://git.ersoft.org/git/hib-dlagent.git/tree/README ."; exit 1')

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/opt/olliolli
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/linux32/* ${pkgdir}/opt/olliolli
  sed '1 a cd /opt/olliolli' -i ${pkgdir}/opt/olliolli/run.sh 
  mv ${pkgdir}/opt/olliolli/run.sh ${pkgdir}/usr/bin/olliolli 
}
