# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="apts"
_module="$_name"

pkgname=("python-$_module")
#pkgname=("python-$_module" "python2-$_module") 
pkgdesc="Set of tools for automatic astrophotography images acquisition and processing"
pkgver="0.2.10"
pkgrel=2
url="https://github.com/pozar87/apts"
license=('Apache 2')
arch=('any')
makedepends=("python-pbr"
             "python-igraph"
             "python-pyephem")
#             "python2-pbr>=1.9"
#             "python2-configparser>=3.5")
source=("https://github.com/pozar87/apts/archive/v$pkgver.tar.gz")
md5sums=('ac6df675fabfae48690ff8e318fdfa98')

build() {
    cd "$_name-$pkgver"
    python setup.py build
#    python2 setup.py build
}

package_python-apts(){
    depends=('python-matplotlib'
             'python-numpy'
             'python-pandas'
             'python-pyephem'
             'python-igraph'
             'python-pint'
             'python-seaborn')
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

#package_python2-apts(){
#    depends=('python2-configparser'
#             'python2-igraph'
#             'python2-ephem'
#             'python2-pandas'
#             'python2-pint')
#    cd "$_name-$pkgver"             
#    python2 setup.py install --root="${pkgdir}/" --optimize=1
#    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENCE
#}

