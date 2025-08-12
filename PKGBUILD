# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=python-nstools
pkgver=1.2.3
pkgrel=1
pkgdesc='Nintendo Switch tools'
arch=('any')
url='https://github.com/seiya-dev/NSTools/'
license=('MIT')
depends=(
  'python'
  'python-zstandard'
  'python-enlighten'
  'python-requests'
  'python-pycryptodome'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/seiya-dev/NSTools/releases/download/v${pkgver}/nstools-${pkgver}.tar.gz")
sha256sums=('84a1fb60d563b4eb39f2b0ba3a383500d35df3b1afc7fa8919cc9d34cea4647f')

build() 
{
  cd "nstools-${pkgver}"
  python -m build --wheel --no-isolation
}

package()
{
  cd "nstools-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
