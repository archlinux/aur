pkgname=python-fairscale
pkgver=0.4.12
pkgrel=1
pkgdesc='PyTorch extensions for high performance and large scale training. '
arch=(x86_64)
url='https://github.com/facebookresearch/fairscale'
license=('custom')
source=("$pkgname-$pkgver::https://github.com/facebookresearch/fairscale/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('1124b70e9f60431d73d4a94260bf2773527ad931f311602ac07305fc31f7865e5aee9c126d10160eabc11891a45e0ac6ca3529e890532fd33e774bae63469bed')
depends=(
    'python-pytorch'
    'python-numpy'
)

build() {
    cd fairscale-$pkgver
    python setup.py build
}

package() {
    cd fairscale-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
