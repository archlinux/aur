# Maintainer: Stunts <f.pinamartins[at]gmail.com>
# Maintainer: Phil Schaf <flying-sheep[at]web.de>
# Maintainer: Carl George < arch at cgtx dot us >

_name=async-timeout
pkgname=python-async-timeout
pkgver=1.2.1
pkgrel=1
pkgdesc='asyncio-compatible timeout class'
arch=('any')
url="https://github.com/aio-libs/${_name}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('380e9bfd4c009a14931ffe487499b0906b00b3378bb743542cfd9fbb6d8e4657')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
}
