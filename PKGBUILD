# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_servicename=format_spec_file
pkgname=obs-service-"${_servicename}"
_pkgver=20211115
_subpkgver=1.1
pkgver="${_pkgver}.${_subpkgver}"
_susepkgver="${_pkgver}-${_subpkgver}"
pkgrel=1
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL2')
depends=('obs-service-source_validator')
source=("http://download.opensuse.org/source/tumbleweed/repo/oss/src/${pkgname}-${_susepkgver}.src.rpm")
sha256sums=('81d68e44765199f3c50b49f0de13fcec21ad67d81be10287d76e2e698d0df327')

prepare() {
  tar -xf "${pkgname}-${_pkgver}.tar.bz2"
}

package() {
  cd "${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
