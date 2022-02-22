# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgver=0.0.6

_namever="${_name}-${pkgver}"
arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="Control Audinate Dante network audio devices without Dante Controller"
pkgname="python-${_name}"
pkgrel=1
sha256sums=('cc5cf4b259ac9f336d4de773cf5d2ff096243d4c5a419c486bc2d50d7c8dc330')
source=('https://files.pythonhosted.org/packages/ac/9c/031faf6cc26f2e4407c3c58818bb3e8e2994e14f947c7aa6f377525689f0/netaudio-0.0.7.tar.gz')
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
