pkgname=python-lion-pytorch
pkgver=0.1.2
pkgrel=1
pkgdesc="🦁 Lion, new optimizer discovered by Google Brain using genetic algorithms that is purportedly better than Adam(w), in Pytorch"
arch=('any')
url="https://github.com/lucidrains/lion-pytorch"
license=('MIT')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucidrains/lion-pytorch/archive/$pkgver.tar.gz")
sha512sums=('3cec0a0ad08776778a2d38120c3b1da4942bd25f0f40070fa596b0fdeffc9be01dc9abe617d0899269f6a91727d4b9ee44ee924e533878bd9941f7c2b06dcf1a')

build() {
    cd lion-pytorch-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd lion-pytorch-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
