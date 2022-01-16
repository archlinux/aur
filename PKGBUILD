# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=python-ifstools
_name=${pkgname#python-}
pkgver=1.14
pkgrel=3
pkgdesc="Extractor/repacker for Konmai IFS files"
arch=('any')
url="https://github.com/mon/${_name}"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
depends=('python-lxml' 'python-tqdm' 'python-pillow' 'python-kbinxml>=1.4')
makedepends=('python' 'python-setuptools')
sha256sums=('db2b6e84aa44ba71d90d1f17fa877a439ca844bddac46860b666d71fef689680')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
