# Maintainer: SelfRef <arch@selfref.dev>

_basename=exscript
pkgname="python-${_basename}"
pkgver=2.6.30
pkgrel=2
pkgdesc="A Python module making Telnet and SSH easy "
arch=('any')
url="https://github.com/knipknap/exscript"
license=('MIT')
depends=('python' 'python-future' 'python-configparser' 'python-pycryptodomex' 'python-paramiko>=1.17')
makedepends=('git' 'python-setuptools')
source=("${_basename}"::"git+https://github.com/knipknap/exscript.git#commit=9d5b035f3de4237dc6ecb7437b3ebd0c162bb6ec")
md5sums=('SKIP')

build() {
	cd ${_basename}
	sed -i "s/DEVELOPMENT/$pkgver/" ./Exscript/version.py
	python setup.py build
}

package() {
	cd ${_basename}
	python setup.py install --root="$pkgdir" --optimize=1
}