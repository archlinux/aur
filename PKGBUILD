# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: NextHendrix <chris dot jones dot 492 at gmail dot com>

_name=asteval
pkgname=python-asteval
pkgver=0.9.16
pkgrel=1
pkgdesc="Safe, minimalistic evaluator of python expression using ast module"
arch=('any')
url=https://github.com/newville/asteval
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('bc71bb4f9ad3ef8ccdc3b9a711e094fb00d768172cb7ff9a15773673aac9e0cc')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
