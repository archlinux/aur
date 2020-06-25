# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=congress-git
pkgver=r728.f327c0a
pkgrel=1
pkgdesc='Public domain data collectors for the work of Congress, including
legislation, amendments, and votes.'
arch=('any')
url='https://github.com/unitedstates/congress/wiki'
license=('CC0')
depends=(python libxml2 libxslt zlib python-pyaml python-iso8601 python-dateutil
    python-lxml python-pytz python-cssselect python-scrapelib python-mechanize
    python-beautifulsoup4 python-mock python-xmltodict python-rtyaml)
makedepends=(python python-setuptools)
provides=(congress)
conflicts=(congress)
source=('git+https://github.com/unitedstates/congress.git')
sha256sums=('SKIP')

_pkgname=congress

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p ${pkgdir}/usr/bin
  cp run ${pkgdir}/usr/bin

  cp -r contrib ${pkgdir}/usr/bin
  cp -r scripts ${pkgdir}/usr/bin
  cp -r tasks ${pkgdir}/usr/bin
}
