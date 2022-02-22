# Maintainer: Christopher Ritsen <chris.ritsen@gmail.com>
_name='netaudio'
pkgver=0.0.4

_namever="${_name}-${pkgver}"
arch=(any)
depends=('python' 'python-cleo' 'python-netifaces' 'python-twisted' 'python-zeroconf')
license=(Unlicense)
makedepends=('python-setuptools')
pkgdesc="Control Audinate Dante network audio devices without Dante Controller"
pkgname="python-${_name}"
pkgrel=1
sha256sums=('11cb90212f2fb4aa6a0a1a801bb63bb8a1d80c896dd0014b51c8ac36a096e9d4')
source=("https://files.pythonhosted.org/packages/9b/04/ba672f919268d29ae32dfac03abc1359b620ac78c0552ac329366f7e8216/${_namever}.tar.gz")
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
   # install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
