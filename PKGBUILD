# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer:Stefan Husmann <stefan-husmann@t-online.de>

pkgname=w3watch-links
_pkgname=w3watch
pkgver=1.0.3
pkgrel=2
pkgdesc='Watch the web and get notified on updates with a patch to use links instead of lynx'
arch=('any')
url='https://git.archlinux.de/w3watch.git/'
license=('GPL')
depends=('bash' 'links' 'awk' 'diffutils' 'coreutils' 'grep')
provides=('w3watch')
conflicts=('w3watch')
source=("w3watch-$pkgver.tar.gz::https://github.com/pierres/w3watch/archive/1.0.3.tar.gz"
         links.diff)
md5sums=('cd20b1402f25e0eec3a8e096b906cfb5'
         '85c0ff5477592450f954a0c8ec7a5bd0')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch  < $srcdir/links.diff
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}
