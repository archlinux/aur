pkgname=caitsith-tools
_basever=0.2
_timestamp=20161229
pkgver=${_basever}_${_timestamp}
pkgrel=1
pkgdesc='CaitSith Linux userspace tools'
url='http://caitsith.osdn.jp/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses')
source=("http://jaist.dl.osdn.jp/caitsith/66538/caitsith-tools-${_basever}-${_timestamp}.tar.gz"
	"http://jaist.dl.osdn.jp/caitsith/66538/caitsith-tools-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('b5d791c87975765b9e8b5c7ade62fa3b34822870978adcb11744f90bcadce9ea'
	'26047ed0d59b52f98e57d5728c80e347a9d10529eebe9a476e479e93df557f53')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
}
