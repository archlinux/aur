# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=twin
pkgver=0.8.0
pkgrel=1
pkgdesc="A text-mode window environment"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/twin/'
license=('GPL2' 'LGPL2.1')
depends=('gpm' 'zlib' 'libxpm')
provides=('twin')
conflicts=('twin')
options=('!makeflags')
source=("https://github.com/cosmos72/twin/archive/v${pkgver}.tar.gz")
md5sums=('35ca4512dceaff97e700b06665c3c8dc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  LDFLAGS="-lX11" ./configure --prefix=/usr --sbindir=/usr/bin \
	--enable-tt=yes \
	--enable-tt-hw-twin=yes \
    --enable-tt-hw-twin-tunnel=yes \
    --enable-tt-hw-twin-detunnel=yes \
	--enable-tt-hw-xml=yes
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
