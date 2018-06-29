# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-source_validator
pkgver=0.18
pkgrel=1
_pkgrel=1.1
pkgdesc='An OBS source service: running all the osc source-validator checks'
arch=('any')
url='https://build.opensuse.org/package/show?package=obs-service-source_validator&project=openSUSE%3AFactory'
license=('GPL2')
depends=('libxml2' 'perl')
provides=("osc-source_validator=$pkgver")
conflicts=('osc-source_validator<=0.1')

source=("http://download.opensuse.org/source/tumbleweed/repo/oss/src/${pkgname}-${pkgver}-${_pkgrel}.src.rpm")


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
md5sums=('3d1611fcf6a795fb29b4942e8ab8923d')
