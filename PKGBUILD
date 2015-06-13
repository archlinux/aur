pkgname=caitsith-tools
_basever=0.1
_timestamp=20140105
pkgver=${_basever}_${_timestamp}
pkgrel=5
pkgdesc='CaitSith Linux userspace tools'
url='http://caitsith.sourceforge.jp/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses')
source=("http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55465/caitsith-tools-${_basever}-${_timestamp}.tar.gz"
	"http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55465/caitsith-tools-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('67e0665918970750fc966881e52f5033522fdb850ed791e12cb3503748fe0758'
	'f9ae6fa9c5501645dc332800a4f9f833de0edf728cd1bca5b0f334970d398820')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
}
