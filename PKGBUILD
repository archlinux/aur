pkgname=caitsith-tools
_basever=0.1
_timestamp=20140105
pkgver=${_basever}_${_timestamp}
pkgrel=4
pkgdesc='CaitSith Linux userspace tools'
url='http://caitsith.sourceforge.jp/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses')
source=("http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55465/caitsith-tools-${_basever}-${_timestamp}.tar.gz")
sha256sums=('67e0665918970750fc966881e52f5033522fdb850ed791e12cb3503748fe0758')

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
}
