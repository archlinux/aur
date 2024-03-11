# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=oils-for-unix
pkgver=0.20.0
pkgrel=1
pkgdesc='Our upgrade path from bash to a better language and runtime.'
arch=('x86_64')
url='https://www.oilshell.org'
license=('Apache-2.0')
depends=('readline')
replaces=('oil')
source=("https://www.oilshell.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('778048463f1b3f277b6b067224f959601c2bfa8f3620a1a1e32e3fbab3983b17')

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
