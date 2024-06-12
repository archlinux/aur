# Maintainer: Abdulkadir Furkan Şanlı <me@abdulocra.cy>
# Contributor: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=oils-for-unix
pkgver=0.22.0
pkgrel=1
pkgdesc='Our upgrade path from bash to a better language and runtime.'
arch=('x86_64')
url='https://www.oilshell.org'
license=('Apache-2.0')
depends=('readline')
replaces=('oil')
source=("https://www.oilshell.org/download/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7ad64ad951faa9b8fd310fc17df0a93291e041ab75311aca1bc85cbbfa7ad45f')

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
