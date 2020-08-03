# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-cli-git
pkgver=1.5
pkgrel=1
pkgdesc='Outscale CLI'

arch=('any')
url='https://github.com/outscale/osc-cli'
license=(GPL3)

makedepends=('python-setuptools')
depends=(python-fire python-requests python-xmltodict)

source=("git://github.com/outscale/osc-cli.git")
sha256sums=("SKIP")

build() {
	cd "${srcdir}/osc-cli"
	python ./setup.py build
}

package() {
	cd "${srcdir}/osc-cli"
	python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
