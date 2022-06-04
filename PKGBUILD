# Maintainer: Filip Graliński <filipg@amu.edu.pl>

pkgname=python-tokenizers
pkgver=0.12.1
pkgrel=1
pkgdesc="Fast and Customizable Tokenizers"
arch=('i686' 'x86_64')
url="https://github.com/huggingface/tokenizers"
license=('Apache License 2.0')
depends=('python-semantic-version'
         'python-setuptools-rust')

source=("https://files.pythonhosted.org/packages/12/57/da0cb8e40437f88630769164a66afec8af294ff686661497b6c88bc08556/tokenizers-${pkgver}.tar.gz")
sha256sums=('070746f86efa6c873db341e55cf17bb5e7bdd5450330ca8eca542f5c3dab2c66')

build() {
    cd tokenizers-$pkgver
    python setup.py build
}

package() {
    cd tokenizers-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
