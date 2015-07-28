pkgname=caitsith-tools
_basever=0.1
_timestamp=20150723
pkgver=${_basever}_${_timestamp}
pkgrel=1
pkgdesc='CaitSith Linux userspace tools'
url='http://caitsith.sourceforge.jp/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses')
source=("http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55465/caitsith-tools-${_basever}-${_timestamp}.tar.gz"
	"http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55465/caitsith-tools-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('f92fb4d9df35295d302f5440558e78672f0625ce77c2f37e0f2e1c6df39d4589'
	'6c432de52ab84bda276a8d082de484f48ede959f4e8eebceda4f8a2886a9bb87')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
}
