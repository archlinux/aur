# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="apts"
_module="$_name"

pkgname=("python-$_module")
#pkgname=("python-$_module" "python2-$_module") 
pkgdesc="Set of tools for automatic astrophotography images acquisition and processing"
pkgver=0.2.28
pkgrel=1
url="https://github.com/pozar87/apts"
license=('Apache 2')
arch=('any')
makedepends=('python-pbr'
             'python-matplotlib'
             'python-numpy'
             'python-pandas'
             'python-pyephem'
             'python-igraph'
             'python-pint'
             'python-seaborn'
             'python-cairo'
             'python-pytz'
             'pyside2'
             'python-aenum'
             'python-svgwrite'
             'python-timezonefinder'
             'python-requests-cache')
source=("https://github.com/pozar87/apts/archive/v$pkgver.tar.gz")
md5sums=('9625dac2533c47a3446e41b1e75be079')

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
             'python-seaborn'
             'python-cairo'
             'python-pytz'
             'pyside2'
             'python-aenum'
             'python-timezonefinder'
             'python-requests-cache')
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

