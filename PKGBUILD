# Maintainer: pumpkincheshire <sollyonzou at gmail dot com>

pkgname=python-pyan3 
_name=pyan3 
pkgver=1.2.0 
pkgrel=1 
pkgdesc='pyan is a Python module that performs static analysis of Python code to determine a call dependency graph between functions and methods.' 
arch=('x86_64') 
url='https://github.com/Technologicat/pyan' 
license=('GPL') 
depends=('python-jinja') 
makedepends=('python' 'python-setuptools') 
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz") 
sha256sums=('36b49b678820e882de7271fb8a18789d57cd1e284f0314bdecd587f02c049a19') 

build() {
     cd "$_name-$pkgver"
     python setup.py build 
} 

package() {
    cd "$_name-$pkgver"
     python setup.py install --root="$pkgdir" --optimize=1 --skip-build 
     install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
     #  install -Dm644 $scrdir/README* "${pkgdir}/usr/share/doc/${pkgname}/README" 
}