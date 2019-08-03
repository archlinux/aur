# Maintainer: Gabriele Musco <emaildigabry@gmail.com>
# Upstream URL: https://github.com/kurtmckee/listparser
# Modified from Eric Bélanger <eric@archlinux.org> PKGBUILD of python-feedparser

pkgname=python-listparser
pkgver=0.18
pkgrel=1
pkgdesc="Parse OPML, FOAF, and iGoogle subscription lists"
arch=('any')
url="https://github.com/kurtmckee/listparser/"
license=('LGPL-3.0')
makedepends=('python-setuptools')
depends=('libxml2' 'python' 'python-requests' 'python-six')
conflicts=('python-listparser-git')
source=("listparser-${pkgver}::git+https://github.com/kurtmckee/listparser#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd listparser-${pkgver}
    #2to3 -w listparser.py
}

package() {
  cd "${srcdir}/listparser-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/license"
}
