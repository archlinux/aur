# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: NextHendrix <chris dot jones dot 492 at gmail dot com>

_name=asteval
pkgname=python-asteval
pkgver=0.9.17
pkgrel=1
pkgdesc="Safe, minimalistic evaluator of python expression using ast module"
arch=('any')
url=https://github.com/newville/asteval
license=('MIT')
depends=('python-numpy')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3e291b2cb71284bc55816fe7ff65ee15e47fa66df98490cdd95f5531fc37b81e')

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
