# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# The documentation fails to build right now

pkgname=python2-nss
pkgver=0.16.0
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
source=("ftp://ftp.mozilla.org/pub/mozilla.org/security/python-nss/releases/PYNSS_RELEASE_${pkgver//./_}/src/python-nss-${pkgver}.tar.bz2")
sha512sums=('3ff7d29f10942f4d36be8e223b518e046b5502f15029aa684b925cbd131bbc2041f7860abd50ec1344479b6e5594735cc9b7fcd801d7c4d1025f68e11a57cc3f')

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
