# Maintainer: Cody Wyatt Neiman (xangelix) <neiman@cody.to>
# Previous Maintainer: (huyz)

pkgname=python-lion-pytorch
pkgver=0.2.3
pkgrel=1
pkgdesc="🦁 Lion, new optimizer discovered by Google Brain using genetic algorithms that is purportedly better than Adam(w), in Pytorch"
arch=('any')
url="https://github.com/lucidrains/lion-pytorch"
license=('MIT')
depends=('python-pytorch')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lucidrains/lion-pytorch/archive/$pkgver.tar.gz")
sha512sums=('48f43b392a992553531141b2685322530ea2b7e611cc4913c014f21aedab5d0ee94489b1c3f154bcef18a7cb038291098fb94830bbc5237653a0a2538d42b4e1')

build() {
    cd lion-pytorch-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd lion-pytorch-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
