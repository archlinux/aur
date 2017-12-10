# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

_name="apts"
_module="$_name"

#pkgname=("python-$_module" "python2-$_module") #
pkgname=("python-$_module")
pkgdesc="Set of tools for automatic astrophotography images acquisition and processing"
pkgver="0.2.3"
pkgrel=1
url="https://github.com/pozar87/apts"
license=('Apache 2')
arch=('any')
makedepends=("python-pbr>=1.9" 
             "python2-pbr>=1.9")
#             "python2-configparser>=3.5")
source=("https://github.com/pozar87/apts/archive/v$pkgver.tar.gz")
md5sums=('c7fe6960d4a2974120aeca289b53427d')

build() {
    cd "$_name-$pkgver"
    python setup.py build
#    python2 setup.py build
}

package_python-apts(){
    depends=('python-igraph'
             'python-pyephem'
             'python-pandas'
             'python-numpy'
             'python-pint')
    cd "$_name-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

#package_python2-apts(){
#    depends=('python2-configparser'
#             'python2-igraph'
#             'python2-ephem'
#             'python2-pandas'
#             'python2-numpy'
#             'python2-pint')
#    cd "$_name-$pkgver"             
#    python2 setup.py install --root="${pkgdir}/" --optimize=1
#    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENCE
#}

