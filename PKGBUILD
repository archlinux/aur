# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=fairseq
pkgver=0.10.2
pkgrel=1
pkgdesc="sequence modeling toolkit"
arch=('i686' 'x86_64')
url="https://github.com/pytorch/fairseq"
license=('MIT')
depends=('cuda'
         'nccl'
         'python-antlr4'
         'python-bitarray'
         'python-hydra'
         'python-omegaconf'
         'python-pytorch')
optdepends=('python-apex: Faster training')
source=("https://github.com/pytorch/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4328a7cb5fe6aea874817a863eb7f1ace91d621bc504345e6d022ce64e065da0')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
