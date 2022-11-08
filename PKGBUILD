# Maintainer: Hongbin Ma <mathmhb@139.com>

_pkgname=open3d
pkgname=python-${_pkgname}-bin
provides=(${_pkgname} python-${_pkgname})
conflicts=(${_pkgname} ${_pkgname}-git  python-${_pkgname} python-${_pkgname}-git  )
pkgver=0.16.0
pkgrel=1
_file=
pkgdesc="Open3D: A Modern Library for 3D Data Processing"
url="https://pypi.org/project/${_pkgname//_/-}/"
arch=('any')
license=('MIT')
depends=('python' 'python-pytorch' 'python-dash' 'python-plotly')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
#sha256sums=('SKIP')

package() {
#  cd ${_pkgname}-${pkgver}
  opt_mirror='-i https://pypi.tuna.tsinghua.edu.cn/simple '
  /usr/bin/pip install ${opt_mirror} --no-deps --root="${pkgdir}" --prefix=/usr -U ${_pkgname}
}
