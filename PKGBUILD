# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-tokenizers
pkgver=0.13.2
pkgrel=1
pkgdesc="Fast and Customizable Tokenizers"
arch=('i686' 'x86_64')
url="https://github.com/huggingface/tokenizers"
license=('Apache License 2.0')
depends=('python-semantic-version'
         'python-setuptools-rust')

source=("https://files.pythonhosted.org/packages/4a/d9/af2821b5934ed871f716eb65fb3bd43e7bc70b99191ec08f20cfd642d0a1/tokenizers-${pkgver}.tar.gz")
sha256sums=('f9525375582fd1912ac3caa2f727d36c86ff8c0c6de45ae1aaff90f87f33b907')

build() {
    cd tokenizers-$pkgver
    python setup.py build
}

package() {
    cd tokenizers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
