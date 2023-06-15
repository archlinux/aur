# Maintainer: Hongbin Ma <mathmhb@139.com>

_pkgname=skimage
pkgname=python-${_pkgname}
provides=(${_pkgname} python-${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git  python-${_pkgname} python-${_pkgname}-git  )
pkgver=0.0.1
pkgrel=1
_file=
pkgdesc="Dummy package that points to scikit-image"
url="https://pypi.org/project/${_pkgname//_/-}/"
arch=('any')
license=('BSD-3')
depends=('python')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
#sha256sums=('SKIP')

package() {
#  cd ${_pkgname}-${pkgver}
  opt_mirror='-i https://pypi.tuna.tsinghua.edu.cn/simple '
  /usr/bin/pip install ${opt_mirror} --no-deps --root="${pkgdir}" --prefix=/usr -U ${_pkgname}
}
