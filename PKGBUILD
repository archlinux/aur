# Maintainer: PumpkinCheshire <sollyonzou@gmail.com>

pkgname=python-mplleaflet
_name=mplleaflet
pkgver=0.0.5
pkgrel=2
pkgdesc="Convert Matplotlib plots into Leaflet web maps"
url="http://github.com/jwass/mplleaflet"
depends=('python' 'python-six' 'python-jinja')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('049e0b91797ce5b462853395138161fed9e8dfc1f4723f482ebb0739a0bbd289')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
