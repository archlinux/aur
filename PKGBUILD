# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="apts"
_module="$_name"

pkgname=("python-$_module")
#pkgname=("python-$_module" "python2-$_module") 
pkgdesc="Set of tools for automatic astrophotography images acquisition and processing"
pkgver="0.2.13"
pkgrel=3
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
             'python-timezonefinder')
source=("https://github.com/pozar87/apts/archive/v$pkgver.tar.gz")
md5sums=('cf69015caca511524653538a26b33b28')

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
             'python-timezonefinder')
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

