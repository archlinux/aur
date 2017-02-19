# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="hgapi"
_module="$_name"
_source="haard-hgapi-609c11e7cc7b"

pkgname=("python-$_module" "python2-$_module")
pkgdesc="Python API to Mercurial using the command-line interface"
pkgver="1.7.3"
pkgrel=3
url="https://bitbucket.org/haard/hgapi"
license=('MIT')
arch=('any')
makedepends=("python-pbr>=1.9" "python2-pbr>=1.9")
source=("https://bitbucket.org/haard/hgapi/get/$pkgver.tar.gz"
        "LICENSE")
md5sums=('0d0aeb97d0c8b5cc724fc36dff84148d'
         '11007b1789fc77217df2cf09b5a3c211')

build() {
  cd "$_source"
  python setup.py build
  python2 setup.py build
}



package_python-hgapi(){
  depends=('python')
  cd "${srcdir}/$_source"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

package_python2-hgapi(){
  depends=('python2')
  cd "${srcdir}/$_source"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

