# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='python-resize-image'
pkgname=('python-resize-image' 'python2-resize-image')
pkgver='1.1.19'
pkgrel='2'
pkgdesc="A Small python package to easily resize images"
arch=("any")
url="https://github.com/VingtCinq/${pkgname}"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('MIT')
source=("https://pypi.io/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
	"https://raw.githubusercontent.com/VingtCinq/${pkgbase}/master/LICENSE")
sha256sums=('2aea25e9811fd44d4cb8fef82059ace114f6cc72bbef059f69b0b7f79f55e03e'
            'bf3a8525e859c6ce1c4b6b463f65ffbe331480aae194c63e896a56d4d7708f08')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

package_python-resize-image() {
  depends=('python-requests' 'python-pillow')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

package_python2-resize-image() {
  depends=('python2-requests' 'python2-pillow')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
