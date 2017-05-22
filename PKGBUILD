pkgname=caitsith-tools
_basever=0.2
_timestamp=20170515
pkgver=${_basever}_${_timestamp}
pkgrel=1
pkgdesc='CaitSith Linux userspace tools'
url='http://caitsith.osdn.jp/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('ncurses')
source=("http://jaist.dl.osdn.jp/caitsith/66538/caitsith-tools-${_basever}-${_timestamp}.tar.gz"
	"http://jaist.dl.osdn.jp/caitsith/66538/caitsith-tools-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('542cbfb60089d0c8410b773e30f19e487d418dd701b64b7b60fcb661aca0f6fb'
	'f058d61d874f450efe0ca9fc81c530b967e355800f079ed1bf82d3aaeecc24d3')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key

build() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin
}

package() {
  cd "${srcdir}/${pkgname}"
  make USRSBINDIR=/usr/bin SBINDIR=/usr/bin INSTALLDIR="${pkgdir}" install
}
