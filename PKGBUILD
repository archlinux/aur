# Maintainer: Stunts <f.pinamartins[at]gmail.com>
# Maintainer: Phil Schaf <flying-sheep[at]web.de>
# Maintainer: Carl George < arch at cgtx dot us >

_name=async-timeout
pkgname=python-async-timeout
pkgver=1.2.0
pkgrel=2
pkgdesc='asyncio-compatible timeout class'
arch=('any')
url="https://github.com/aio-libs/${_name}"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('0652d108c0156ae5ac94d99f53a6bdd039b0c076346ff8f58c9a1551fac17a19')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install --skip-build --optimize=1 --root="${pkgdir}"
}
