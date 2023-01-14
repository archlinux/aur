# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Original contributor: Jerry Lin <jerry73204 at gmail dot com>

pkgname='python-fvcore'
pkgver=0.1.5.post20221221
pkgrel=1
pkgdesc="Collection of common code that's shared among different research projects in FAIR computer vision team."
arch=('any')
url="https://github.com/facebookresearch/fvcore"
license=('Apache')
makedepends=('python-setuptools')
depends=('python')
source=("https://files.pythonhosted.org/packages/a5/93/d056a9c4efc6c79ba7b5159cc66bb436db93d2cc46dca18ed65c59cc8e4e/fvcore-${pkgver}.tar.gz")
sha256sums=('f2fb0bb90572ae651c11c78e20493ed19b2240550a7e4bbb2d6de87bdd037860')

_dirname="fvcore-${pkgver}"

build() {
  cd "${srcdir}/${_dirname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_dirname}"
  python setup.py install --root="$pkgdir" --optimize=1
}
