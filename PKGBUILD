# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Maintainer:Stefan Husmann <stefan-husmann@t-online.de>

pkgname=w3watch-links
_pkgname=w3watch
pkgver=1.0.3
pkgrel=1
pkgdesc='Watch the web and get notified on updates with a patch to use links instead of lynx'
arch=('any')
url='https://git.archlinux.de/w3watch.git/'
license=('GPL')
depends=('bash' 'links' 'awk' 'diffutils' 'coreutils' 'grep')
provides=('w3watch')
conflicts=('w3watch')
source=("https://users.archlinux.de/~pierre/src/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "https://users.archlinux.de/~pierre/src/${_pkgname}/${_pkgname}-${pkgver}.tar.gz.sig" links.diff)
md5sums=('cb539783d39f0bf50aa67494e7845291'
         'SKIP'
         '85c0ff5477592450f954a0c8ec7a5bd0')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch  < $srcdir/links.diff
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}
