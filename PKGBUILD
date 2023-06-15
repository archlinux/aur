# Maintainer: Hongbin Ma <mathmhb@139.com>

pkgname=python-pointnet2
_pkgname=pointnet2
pkgver=3.0.0
pkgrel=1
_file=
pkgdesc="Pointnet2/Pointnet++ PyTorch"
url="https://gitee.com/wang-zhaozhong/pointnet2.git"
arch=('any')
license=('unlicense')
depends=('python' 'python-numpy' 'python-pytest' 'python-pytorch')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}::git+https://gitee.com/wang-zhaozhong/pointnet2.git")
sha256sums=('SKIP')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  cd pointnet2_ops_lib
  sed -i "s/3.7+PTX;//" setup.py
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
