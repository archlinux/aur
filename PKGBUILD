# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: NextHendrix <chris dot jones dot 492 at gmail dot com>

_name=asteval
pkgname=python-asteval
pkgver=0.9.19
pkgrel=1
pkgdesc="Safe, minimalistic evaluator of python expression using ast module"
arch=('any')
url=https://github.com/newville/asteval
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('445f3a59df692c0c0ff2868c0bbf9b293884db4a9f9a13c73555485ba75ed08b')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
