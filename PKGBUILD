# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=oils-for-unix
pkgver=0.24.0
pkgrel=1
pkgdesc='Our upgrade path from bash to a better language and runtime.'
arch=('x86_64')
url='https://www.oilshell.org'
license=('Apache-2.0')
depends=('readline')
replaces=('oil')
source=("https://www.oilshell.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('df4afed94d53b303a782ce0380c393d60f6d21921ef2a25922b400828add98f3')

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
