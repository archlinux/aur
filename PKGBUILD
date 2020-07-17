# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codereview
pkgver=1.0.0
pkgrel=1
pkgdesc='A Git GUI tool to perform code review (Diff Viewer) written in Python3 and Qt5'
arch=('x86_64')
url="http://fabricesalvaire.github.io/CodeReview"
license=('GPL3')
depends=('python-pyqt5'
         'python-pygments'
         'python-yaml'
         'python-pygit2')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FabriceSalvaire/CodeReview/archive/v${pkgver}.tar.gz")
sha256sums=('e490a0fe080c57fdf56f272d06cf70b37f91e9a05147595a1f596d98fd8ce0d2')

prepare() {
  cd "CodeReview-${pkgver}"
  sed -i "50s|.*||" CodeReview/Tools/Platform.py
}

build() {
  cd "CodeReview-${pkgver}"
  python setup.py build
}

package() {
  cd "CodeReview-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}