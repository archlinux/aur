# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgver=0.0.8

_namever="${_name}-${pkgver}"
arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="Control Audinate Dante network audio devices without Dante Controller"
pkgname="python-${_name}"
pkgrel=1
sha256sums=('6b2904c4b70e7ad5cc43a74637e5fdcbefb290cd5e60b316dd65cf042cb081d6')
source=('https://files.pythonhosted.org/packages/16/a6/16b57eff44a0aaa8278e17bb31769ed937ba746481fb30dcc3d591589cb6/netaudio-0.0.8.tar.gz')
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
