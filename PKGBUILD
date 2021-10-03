# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=vampy-host
pkgver=2.3
pkgrel=1
pkgdesc="Wrapper plugin that enables you to use Python Vamp in any Vamp host."
arch=(any)
url="https://code.soundsoftware.ac.uk/projects/pyin"
_url="https://github.com/c4dm/vampy-host"
_sdk_url="https://github.com/c4dm/vamp-plugin-sdk"
license=('GPL')
depends=(vamp-plugin-sdk python python2)
source=("git+$_url")
md5sums=('SKIP') 

package() {
	cd $pkgname
        git clone $_sdk_url
        python setup.py build_ext
        python3 setup.py install --root="${pkgdir}" --optimize=1
}
