# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgver=0.0.10

_namever="${_name}-${pkgver}"
arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="List, configure, and control Audinate Dante network audio devices without Dante Controller"
pkgname="python-${_name}"
pkgrel=1
sha256sums=('5fa66cb3f479dfa09a8881995978082a19510ae557c6303257802bd74f1ba657')
source=('https://files.pythonhosted.org/packages/5a/53/2d6a3d5354480c1af0c1ca0cfcc7af1eac9e63083a7a8ab6df2041b6f633/netaudio-0.0.10.tar.gz')
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
