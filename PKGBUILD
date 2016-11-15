# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# The documentation fails to build right now

pkgname=python-nss
pkgver=1.0.0
pkgrel=1
pkgdesc="Python 3 bindings for NSS and NSPR"
arch=(i686 x86_64)
url="ftp://ftp.mozilla.org/pub/mozilla.org/security/python-nss"
license=(MPL GPL LGPL)
depends=(python nspr nss)
#makedepends=(python-setuptools python-docutils epydoc)
makedepends=(python-setuptools)
options=(!emptydirs)
# Official mirror isn't working. We'll use Fedora's mirror
source=("https://ftp.mozilla.org/pub/security/python-nss/releases/PYNSS_RELEASE_${pkgver//./_}/src/python-nss-${pkgver}.tar.bz2")
sha512sums=('cf0ab25be1f31eca1e48253de43d8740556c9cb060ad13e6ab59bb277c8bb53d4e2d2d354ca23bcf178c5a522d01f5c1e00c4f473a2e3f8e9ab9eb5ec1677f99')

build() {
  cd "python-nss-${pkgver}"

  python3 setup.py build
  #python3 setup.py build_doc
}

package() {
  cd "python-nss-${pkgver}"

  python3 setup.py install --skip-build --root="${pkgdir}/" --optimize=1
  #python3 setup.py install_doc --skip-build
}
