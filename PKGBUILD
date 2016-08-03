# Maintainer: Jan Cholasta <grubber at grubber cz>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# The documentation fails to build right now

pkgname=python-nss
pkgver=1.0.0beta1
pkgrel=1
pkgdesc="Python 2 bindings for NSS and NSPR"
arch=(i686 x86_64)
url="ftp://ftp.mozilla.org/pub/mozilla.org/security/python-nss"
license=(MPL GPL LGPL)
depends=(python nspr nss)
#makedepends=(python-setuptools python-docutils epydoc)
makedepends=(python-setuptools)
options=(!emptydirs)
# Official mirror isn't working. We'll use Fedora's mirror
source=("ftp://ftp.mozilla.org/pub/mozilla.org/security/python-nss/releases/PYNSS_RELEASE_${pkgver//./_}/src/python-nss-${pkgver}.tar.bz2")
sha512sums=('acf3e119a2ceac7a939101ee45dede84c93f02f509f39d25a0f0c37ff2bd4628c6c4501175fbb188fa32e6899504a14ee0a54c885850d28373e7c467254277c0')

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
