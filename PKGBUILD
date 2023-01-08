# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Benoit Pierre <benoit.pierre@gmail.com>

pkgname="python-rtf_tokenize"
pkgver=1.0.0
pkgrel=7
pkgdesc="Simple RTF tokenizer package for Python"
url="https://github.com/openstenoproject/rtf_tokenize"
license=("GPL2")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bcaecdf0d6092659ab988a8f4a406a72fd7d712791446d002b2818738289ae40')

build(){
 cd "rtf_tokenize-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "rtf_tokenize-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
