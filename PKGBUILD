# Maintainer: asermax <asermax@gmail.com>
_branch='a97e7bf1f7f6d89a4c4c7ce6595eecab50ff334d'

pkgname=kaggle-api
pkgver=1.1.0
pkgrel=1
pkgdesc='Kaggle API CLI'

arch=('any')
url="http://kaggle.com/"
license=('Apache')

depends=(
  'python'
  'python-urllib3'
  'python-six'
  'python-certifi'
  'python-dateutil'
)
makedepends=(
  'python-setuptools'
)

source=(
  "https://github.com/Kaggle/kaggle-api/archive/${_branch}.tar.gz"
)

md5sums=('cafb51206bf9677f70bb3951bbca15f5')

package() {
  cd "${pkgname}-${_branch}"

  # Python setup
  python setup.py install --root="${pkgdir}"/ --prefix=/usr --optimize=1

  # License
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
