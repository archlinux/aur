# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_servicename=format_spec_file
pkgname=obs-service-${_servicename}
pkgver=20191114
pkgrel=1
_pkgver=1.3
pkgrel=1
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL2')
depends=('obs-service-source_validator' 'perl-timedate')
source=("http://download.opensuse.org/source/tumbleweed/repo/oss/src/${pkgname}-${pkgver}-${_pkgver}.src.rpm")
sha256sums=('cbfcbd82f0b14ec1b4cffb4ea393aa4f17e28b437c0fb41954544d068e7854d2')

prepare() {
  cd "$srcdir"
  tar -xf "$pkgname-$pkgver.tar.bz2"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}
