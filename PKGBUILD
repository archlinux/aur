# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname=python-merge-kicad-sym
pkgver=0.1.1
pkgrel=1
pkgdesc="A script to merge KiCad symbol libraries"
arch=('any')
url="https://github.com/McMaster-Rocketry-Team/merge-kicad-sym"
license=('MIT')
depends=('python')

makedepends=('python-setuptools')

options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/1e/27/f7e7c4e3254a01e2b48f40429689d3ceb11053f6653997a1d00a5c961816/merge_kicad_sym-${pkgver}.tar.gz")
sha256sums=('e690250e5c677c65e8d70d1b6cd0ac211a0c9a76685ed2e7b17e9506ea36c4c7')

build() {
	cd "${srcdir}/merge_kicad_sym-${pkgver}"
    rm -rf dist
	python -m build --wheel
}

package() {
	cd "${srcdir}/merge_kicad_sym-${pkgver}"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
