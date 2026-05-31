# Maintainer: noraj <printf %s 'YWxleGFuZHJlLnphbm5pQGV1cm9wZS5jb20='|base64 -d>

pkgname=python-aiortsp
_pkgname=${pkgname#python-}
pkgver=1.4.0
pkgrel=1
pkgdesc='An Asyncio-based RTSP library.'
arch=('any')
url='https://github.com/marss/aiortsp'
license=('LGPL-3.0-only')
depends=('python-dpkt')
makedepends=('python-build' 'python-installer' 'python-setuptools'
             'python-wheel')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('7d50c79bff588bc5ebc4a193fb0f152dd0a1d048f3904ddef5bd698d5a50f1c4793fd318b13a09d5f8fc5577443582193f9c3ae12890a32075d81d2758f6d154')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}

