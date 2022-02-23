# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgver=0.0.9

_namever="${_name}-${pkgver}"
arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="List, configure, and control Audinate Dante network audio devices without Dante Controller"
pkgname="python-${_name}"
pkgrel=1
sha256sums=('66539dae173311e98481763ddb42503da5f1703ad02a5ea05593cc064d62f165')
source=('https://files.pythonhosted.org/packages/14/7b/7dfbfabc39328e6c4300de73c10c97006973e111261f0020a1ceade0fbbd/netaudio-0.0.9.tar.gz')
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
