# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.3
pkgrel=1
_pkgrel=5.3
pkgdesc='An OBS source service: running all the osc source-validator checks'
arch=('any')
url='https://build.opensuse.org/package/show?package=obs-service-source_validator&project=openSUSE%3AFactory'
license=('GPL2')
depends=('perl-timedate')
provides=('osc-source_validator=0.2')
conflicts=('osc-source_validator<=0.1')
source=("http://download.opensuse.org/source/factory/repo/oss/suse/src/${pkgname}-${pkgver}-${_pkgrel}.src.rpm")
md5sums=('40ac5b77bbe6850ccc78f16eafb16701')

build() {
  cd "$srcdir"
  tar -xf "$pkgname-$pkgver.tar.bz2"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/obs/service/source_validators"
  install -m755 source_validator "$pkgdir/usr/lib/obs/service/"
  install -m644 source_validator.service "$pkgdir/usr/lib/obs/service/"
  cp -a [0-9]* helpers "$pkgdir/usr/lib/obs/service/source_validators/"
}

# vim:set ts=2 sw=2 et:
