pkgname=python-dm-env
pkgver=1.5
pkgrel=1
pkgdesc="A Python interface for reinforcement learning environments"
url="https://github.com/deepmind/dm_env"
license=("Apache-2.0")
arch=('x86_64')
depends=('python' 'python-absl' 'python-dm-tree' 'python-numpy')
makedepends=('python-setuptools')
source=("https://github.com/deepmind/dm_env/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a35d10fb4a70a00187a23f128bc4041560847154b8cd1441bbdf2845f5ad3519')

build() {
    cd "${srcdir}/dm_env-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/dm_env-$pkgver"
    python setup.py install --root "$pkgdir" --optimize=1 --skip-build
}
