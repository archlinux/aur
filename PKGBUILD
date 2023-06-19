# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=vampy-host
pkgver=1.0.2
pkgrel=1
pkgdesc="Wrapper plugin that enables you to use Python Vamp in any Vamp host."
arch=('x86_64'
      'i686'
      'pentium4')
url="https://code.soundsoftware.ac.uk/projects/pyin"
_url="https://github.com/c4dm/${pkgname}"
_sdk_url="https://github.com/c4dm/vamp-plugin-sdk"
license=('GPL')
depends=(vamp-plugin-sdk python python2)
source=("${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=(
  'b316c16ece76f5abf0f5c992849e42e800c03a16b5f0648a0bd79f8e2bfea54f'
  ) 

package() {
	cd "${pkgname}-${pkgver}"
        git clone "${_sdk_url}"
        python setup.py build_ext
        python3 setup.py install --root="${pkgdir}" --optimize=1
}
