# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="hgapi"

pkgname=("python-hgapi")
pkgdesc="Python API to Mercurial using the command-line interface"
pkgver=1.7.4
pkgrel=4
url="https://github.com/haard/hgapi"
license=('MIT')
arch=('any')
makedepends=("python-setuptools")
depends=("python")
source=("https://files.pythonhosted.org/packages/36/db/6ad72214343e361c3fae732230e64bb7a5e4580002027782a4406748aee6/hgapi-$pkgver.tar.gz"
        "LICENSE")
sha256sums=('0b1f20a6a8cefe9e9f72b14a0823b7abdbc88d19cdf815211849067d9ac27ebc'
            '34a43d8b2e06c3c6f3cdec53c705424d4af60e4c59642c8239cc5c62e74eaeed')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package_python-hgapi(){
  cd "${srcdir}/$_name-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

