# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=oils-for-unix
pkgver=0.21.0
pkgrel=1
pkgdesc='Our upgrade path from bash to a better language and runtime.'
arch=('x86_64')
url='https://www.oilshell.org'
license=('Apache-2.0')
depends=('readline')
replaces=('oil')
source=("https://www.oilshell.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('83cb842baf09f41b021c4bc918382c2949acb91d4cbc28440bd034d18dac654e')

build ()
{
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr
	_build/oils.sh
}

package ()
{
	cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ./install
}
