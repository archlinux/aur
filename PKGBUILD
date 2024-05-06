# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>
# Previous Maintainer: (huyz)

pkgname=python-lion-pytorch
pkgver=0.1.4
pkgrel=1
pkgdesc="🦁 Lion, new optimizer discovered by Google Brain using genetic algorithms that is purportedly better than Adam(w), in Pytorch"
arch=('any')
url="https://github.com/lucidrains/lion-pytorch"
license=('MIT')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucidrains/lion-pytorch/archive/$pkgver.tar.gz")
sha512sums=('0413eb0badf89a4899c79d949d96d4d4d0bbc8dd1f5ec85ab3ebacdc41cf9c6ed863f8da7135a7b3d78c49cd3e36a92a944647274b7f0f9f61292b4d215fa6a3')

build() {
    cd lion-pytorch-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd lion-pytorch-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
