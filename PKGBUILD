# Maintainer: Evan Chen <evan@evanchen.cc>

pkgname=tsqx
_name=tsqx
pkgver=1.0.0
pkgrel=2
pkgdesc='Asymptote pre-processor for Euclidean geometry diagrams'
arch=(any)
url=https://github.com/vEnhance/tsqx
license=(MIT)
depends=(python)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  LICENSE)

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
b2sums=('8783ac44003e7c36c6b7546a6074c052352554cea526e42c7431da5cfd50735ca6db435ddd32a296a987d6d579221092ff908f5d6ee444c1b258f26943c1e1e0'
        '3ea48a19bf9b3ed6184f7b244fc2cf37e9a6328cb5af2895e3f55a7e18df54c009b93a205821ca1b50c8747711fec04cdbecbe08613965aa6112f0de30fbc681')
