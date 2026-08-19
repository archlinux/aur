# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=python-nstools
pkgver=2.0.0b7
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
  'nsz'
)
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/seiya-dev/NSTools/releases/download/v${pkgver}/nstools-${pkgver}.tar.gz")
sha256sums=('fbf4083b7d6ef346cb83dc94c5ece9347de478e58ab758ec2f61e730dbb02524')

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
