# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-tokenizers
pkgver=0.10.3
pkgrel=1
pkgdesc="Fast and Customizable Tokenizers"
arch=('i686' 'x86_64')
url="https://github.com/huggingface/tokenizers"
license=('Apache License 2.0')
depends=('python-semantic-version'
         'python-setuptools-rust')

source=("https://files.pythonhosted.org/packages/48/2b/b99184cacb1a743edc18290e9127d1b0e658c0c46f2ab5290b27fe865ff4/tokenizers-${pkgver}.tar.gz")
sha256sums=('1a5d3b596c6d3a237e1ad7f46c472d467b0246be7fd1a364f12576eb8db8f7e6')


build() {
    cd tokenizers-$pkgver
    python setup.py build
}

package() {
    cd tokenizers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
