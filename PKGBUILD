# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>
# Previous Maintainer: (huyz)

pkgname=python-lion-pytorch
pkgver=0.2.2
pkgrel=1
pkgdesc="🦁 Lion, new optimizer discovered by Google Brain using genetic algorithms that is purportedly better than Adam(w), in Pytorch"
arch=('any')
url="https://github.com/lucidrains/lion-pytorch"
license=('MIT')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucidrains/lion-pytorch/archive/$pkgver.tar.gz")
sha512sums=('fbe3f8594c8fc752e0b7647e50159201b9f3033f41fbf40f0d80fe4045987561dd497017309827a15922efe102ff246c45a07ea40e87788ac4849c2ffef06b0a')

build() {
    cd lion-pytorch-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd lion-pytorch-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
