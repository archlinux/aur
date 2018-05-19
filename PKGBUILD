# Maintainer: Uffe Jakobsen _<_uffe_at_uffe_dot_org_>_
pkgname=proploader
_pkgname=PropLoader
pkgver=1.0_37
_pkgver=1.0-37
pkgrel=1
pkgdesc="Parallax Propeller loader supporting both serial and wifi downloads"
arch=('x86_64' 'i686')
url="https://github.com/parallaxinc/PropLoader"
license=('MIT')
groups=()
depends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}-git")
replaces=()
backup=()
options=()
install=
source=("https://github.com/parallaxinc/${_pkgname}/archive/v${_pkgver}.tar.gz")
md5sums=('d758a0bfe2f477ecbffb130159f58cb3')


build()
{
	cd "${srcdir}/${_pkgname}-${_pkgver}"
	make OS=linux BUILD="${PWD}/build" GITDESC="${_pkgver}"
}

package()
{
	cd "${srcdir}/${_pkgname}-${_pkgver}"
  install -Dm 755 "build/bin/proploader" "${pkgdir}/usr/bin/proploader"
  install -Dm 755 "build/bin/split" "${pkgdir}/usr/bin/proploader-split"
  install -Dm 755 "build/bin/split" "${pkgdir}/usr/bin/proploader-split"
  install -Dm 755 "build/blink-fast.binary" "${pkgdir}/usr/share/proploader/blink-fast.binary"
  install -Dm 755 "build/blink-slow.binary" "${pkgdir}/usr/share/proploader/blink-slow.binary"
}

#
# EOF
#
