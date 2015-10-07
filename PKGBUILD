# Maintainer: Peter Lamby <peterlamby@web.de>
pkgname=deadbeef-replaygain-scan-git
_gitname=ddb_misc_replaygain_scan
pkgver=10.154527e
pkgrel=1
pkgdesc="Replay scan control plugin for DeadBeeF music player."
arch=('i686' 'x86_64')
url="https://bitbucket.org/Lithopsian/deadbeef-opus"
license=('GPL2')
provides=(deadbeef-replaygain-scan)
conflicts=(deadbeef-replaygain-scan)
depends=('deadbeef')
source=('git+https://github.com/Soukyuu/ddb_misc_replaygain_scan.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}


build() {
  cd "${srcdir}/$_gitname"
  make
}

package() {
  cd "${srcdir}/$_gitname"
  install -dm 755 "$pkgdir/usr/lib/deadbeef"
  cp ddb*.so "$pkgdir/usr/lib/deadbeef"
}
