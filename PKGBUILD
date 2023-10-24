# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=marcel
pkgver=0.18.3
pkgrel=1
pkgdesc='A modern shell'
url='https://github.com/geophile/marcel'
source=("https://github.com/geophile/marcel/archive/refs/tags/v$pkgver.tar.gz")
arch=('any')
depends=('python' 'python-dill' 'python-psutil')
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
license=('GPL')
b2sums=('105cfbe34453a9ecd2eed576bb0b157ae9092a04a3ef0fda030d595ede547c2823026ce05e7df1a0d368391d1a5ded5696abe9cfb74927cbe87710b4cac4b632')

build() {
  cd marcel-"$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd marcel-"$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
