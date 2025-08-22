# Maintainer: @kjlsai <zhangjian@sipeed.com>

pkgname='python-maixtool'
_module=${pkgname#python-}
pkgver=1.4.4
pkgrel=1
pkgdesc='Tools for Maix series development'
url='https://github.com/sipeed/MaixCDK'
arch=('x86_64')
license=('Apache-2.0')
depends=('python-flask' 'python-pillow' 'python-netifaces' 'python-qrcode' 'python-yaml' 'python-progress' 'python-requests' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
b2sums=('ff1f4475838cd7f492e5c2b0e22bfb7070d0281146c3fe914f85fe5942a90a9f8d58235a767b55bbce849ba940896ebb1b9226fe9e1b552cda7ab9d91d5fab06')

build() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_module}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=2 --skip-build
}
