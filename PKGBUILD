# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgver=0.0.5

_namever="${_name}-${pkgver}"
arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="Control Audinate Dante network audio devices without Dante Controller"
pkgname="python-${_name}"
pkgrel=1
sha256sums=('655faf6d035dfed908454cd48880f60381c013a4b2f06a908281ee2b067607bb')
source=("https://files.pythonhosted.org/packages/5d/0e/7abd65ce89e90bc6e0bb997c91ed1723fbe8c2e72ae449c24464acaadef8/netaudio-0.0.5.tar.gz")
url='https://github.com/chris-ritsen/network-audio-controller'

prepare() {
   rm -rf ${_namever}/*.egg-info
}

build() {
   cd ${_namever}
   python setup.py build
}

package() {
   cd ${_namever}
   python setup.py install --root="$pkgdir" --optimize=1 --skip-build
   mkdir -p "$pkgdir"/usr/share/licenses/$pkgname/
   install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
