# Maintainer: Florian Dejonckheere <florian at floriandejonckheere dot be>

pkgname=mpdproxy-git
_pkgname=mpdproxy
pkgver=8522ed8
pkgrel=1
pkgdesc="Simple MPD TCP proxy"
arch=(i686 x86_64)
url="https://github.com/floriandejonckheere/mpdproxy"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=("${_pkgname}")
source=("git://github.com/floriandejonckheere/${_pkgname}.git")
md5sums=('SKIP')

pkgver()
{
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's|-|.|g'
}


build()
{
	cd "${srcdir}/${_pkgname}"
	make
}

package()
{
	cd "${srcdir}/${_pkgname}"
	install -Dm755 mpdproxy "${pkgdir}/usr/bin/mpdproxy"
	install -Dm644 mpdproxy.conf "${pkgdir}/etc/mpdproxy.conf"
}
