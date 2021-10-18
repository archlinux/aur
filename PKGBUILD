# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=fairseq-git
pkgver=0.11
pkgrel=2
pkgdesc="Sequence modeling toolkit"
arch=('i686' 'x86_64')
url="https://github.com/pytorch/fairseq"
license=('MIT')
provides=('fairseq')
conflicts=('fairseq')
depends=('cuda'
         'nccl'
         'python-antlr4'
         'python-bitarray'
         'python-hydra'
         'python-omegaconf'
         'python-pytorch')
optdepends=('python-apex: Faster training')
source=("git+$url")
sha256sums=('SKIP')

build() {
    cd fairseq
    python setup.py build
}

package() {
    cd fairseq
    python setup.py install --root="$pkgdir" --optimize=1
}
