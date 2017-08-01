# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=trx-git
_pkgname=trx
pkgver=0.2.7.g14927fb
pkgrel=1
pkgdesc="Toolset for sending and receiving encoded audio over IP networks"
arch=('i686' 'x86_64')
url="http://www.pogo.org.uk/~mark/trx/"
license=('GPL')
depends=('ortp' 'opus' 'alsa-lib')
makedepends=('git')
provides=('trx')
source=("${pkgname}::git+http://www.pogo.org.uk/~mark/${_pkgname}.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${pkgname}"
	git describe --always | sed 's|-|.|g'
}

build()
{
	cd "${srcdir}/${pkgname}"
	make
}

package()
{
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
