# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-pydub
pkgver=0.15.0
pkgrel=2
pkgdesc="Manipulate audio with an simple and easy high level interface"
url="http://pydub.com"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/jiaaro/pydub/archive/v$pkgver.tar.gz")

build() {
    cd $srcdir/pydub-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/pydub-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha1sums=('239ac1dfc2c331cb7b0d086e4624aa24280c34bf')
sha256sums=('f0195a20a9eb7110e917105ceb00f4a712abaf070150d12a7dd8c2a84b011afe')
md5sums=('946e402d8da0bc54dd72899f33213342')
