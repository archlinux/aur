# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='python-resize-image'
pkgname=('python-resize-image' 'python2-resize-image')
pkgver='1.1.19'
pkgrel='1'
pkgdesc="Search for image using Google Custom Search API and resize & crop the image afterwords"
arch=("any")
url="https://github.com/VingtCinq/${pkgname}"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('MIT')
source=("https://pypi.io/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2aea25e9811fd44d4cb8fef82059ace114f6cc72bbef059f69b0b7f79f55e03e')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

package_python-resize-image() {
  depends=('python-requests' 'python-pillow')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-resize-image() {
  depends=('python2-requests' 'python2-pillow')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
