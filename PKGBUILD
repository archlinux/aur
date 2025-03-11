# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Butui Hu <hot123tea123@gmail.com>

_name=ydata-profiling
pkgname=python-ydata-profiling
pkgver=4.14.0
pkgrel=1
pkgdesc='Create HTML profiling reports from pandas DataFrame objects'
arch=(any)
url='https://github.com/ydataai/ydata-profiling'
license=(MIT)
depends=(
  ipython
  python
  python-dacite
  python-dateutil
  python-htmlmin
  python-imagehash
  python-ipywidgets
  python-jinja
  python-matplotlib
  python-markupsafe
  python-multimethod
  python-networkx
  python-numba
  python-numpy
  python-packaging
  python-pandas
  python-phik
  python-pillow
  python-pydantic
  python-requests
  python-seaborn
  python-scipy
  python-statsmodels
  python-tangled-up-in-unicode
  python-tqdm
  python-typeguard
  python-visions
  python-wordcloud
  python-yaml
)
conflicts=(python-pandas-profiling)
replaces=(python-pandas-profiling)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)

source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
b2sums=('8d68e1e23d813d1dbf69ebdaa471fc9437c1aa0c0d887a540567c0262f3396b8d386e5366c340ce60060677eafd45c92b44a3df0a8efee29e52718e5da0fe55b')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
