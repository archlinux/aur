# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>
# Contributor: Paul Clark <paul500clark at gmail dot com>
# Contributor: Philip Mueller <mail at philip.in-aachen dot net>
pkgname=xfce4-hdaps
pkgver=1.0.3
pkgrel=1
pkgdesc="A plugin to indicate the status of the IBM Hard Drive Active  Protection System, or HDAPS."
arch=('i686' 'x86_64')
license=('GPL')
url="http://michael.orlitzky.com/code/xfce4-hdaps.php"
depends=('tp_smapi' 'xfce4-panel')
makedepends=('pkgconfig' 'intltool')
install="xfce4-hdaps.install"
source=("http://michael.orlitzky.com/code/releases/${pkgname}-${pkgver}.tar.xz"
	xfce4-hdaps.install)
md5sums=('e59cdc24a1caeb8dc7ea72a60862fcaa'
         'a5f113c7a0f7a94ec39d5a3b83640724')

prepare()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
}

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
