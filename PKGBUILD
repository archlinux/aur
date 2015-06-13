# $Id: PKGBUILD 536 2014-08-31 08:14:05Z pierre $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=w3watch
pkgver=1.0.3
pkgrel=2
pkgdesc='Watch the web and get notified on updates'
arch=('any')
url='https://projects.pierre-schmitz.com/w3watch.git/'
license=('GPL')
depends=('bash' 'lynx' 'awk' 'diffutils' 'coreutils' 'grep')
makedepends=('git')
source=("${pkgname}::git+https://projects.pierre-schmitz.com/w3watch.git/#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
	cd ${srcdir}/${pkgname}
	git verify-tag ${pkgver}
}

package() {
	cd ${srcdir}/${pkgname}
	make install DESTDIR=${pkgdir}
}
