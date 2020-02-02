pkgname=python-yum-metadata-parser
pkgver=1.1.4
pkgrel=1
pkgdesc='C-based metadata parser to quickly parse xml metadata into sqlite databases.'
arch=('x86_64')
license=('GPL')
url='http://yum.baseurl.org/download/yum-metadata-parser/'
depends=('python' 'libxml2'  'glib2' 'sqlite')
makedepends=('python-setuptools')
_commit=b2565c134876542b44ae795553229912ccbb078e
source=(yum-metadata-parser-$pkgver.zip::https://github.com/rpm-software-management/yum-metadata-parser/archive/$_commit.zip)
sha256sums=('a77f9cee6e2c365adb229cbc24983ca4548b213e8cf83ec936851d743fff61dc')

build() {
  cd "yum-metadata-parser-$_commit"
  python setup.py build
}

package() {
  cd "yum-metadata-parser-$_commit"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
}
