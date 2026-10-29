# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>

pkgname="python-rtf_tokenize"
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple RTF tokenizer package for Python"
url="https://github.com/openstenoproject/rtf_tokenize"
license=("GPL2")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d2484990a1d760d3ff8e98dcd1f6e11fc84e506d83fbd96eac43a8dc54123b5e')

build(){
 cd "rtf_tokenize-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "rtf_tokenize-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
