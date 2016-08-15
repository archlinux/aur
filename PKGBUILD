# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# The documentation fails to build right now

pkgname=python2-nss
pkgver=0.17.0
pkgrel=1
pkgdesc="Python 2 bindings for NSS and NSPR"
arch=(i686 x86_64)
url="ftp://ftp.mozilla.org/pub/mozilla.org/security/python-nss"
license=(MPL GPL LGPL)
depends=(python2 nspr nss)
#makedepends=(python2-distribute python2-docutils epydoc)
makedepends=(python2-distribute)
options=(!emptydirs)
# Official mirror isn't working. We'll use Fedora's mirror
source=("https://ftp.mozilla.org/pub/mozilla.org/security/python-nss/releases/PYNSS_RELEASE_${pkgver//./_}/src/python-nss-${pkgver}.tar.bz2")
sha512sums=('a2c37c52d14303e37f5c44c453bd3badebf28c7ae72b029fb0e03596a146672f453e69bf77c1e57d81faf2cafc3bf36f422d8b847a9b7425a5d6e29a4effb363')

build() {
  cd "python-nss-${pkgver}"

  python2 setup.py build
  #python2 setup.py build_doc
}

package() {
  cd "python-nss-${pkgver}"

  python2 setup.py install --skip-build --root="${pkgdir}/" --optimize=1
  #python2 setup.py install_doc --skip-build
}
