# Maintainer: EvaristeGalois11 <turbo dot backslid four zero zero at passinbox dot com>
# Contributor: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-spatialmedia
pkgver='2.1.r23.g57c85bb'
pkgrel=2
pkgdesc="Specifications and tools for 360 video and spatial audio."
arch=('any')
url='https://github.com/google/spatial-media'
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'git')
_commit='57c85bb5691518406408b675e52f430e0c62798c'
source=("git+https://github.com/google/spatial-media.git#commit=${_commit}"
		"spatialmedia.sh")
sha256sums=('6384616de33e60e2ac6f56c8c2d7739bca98d5415d3ce980826267f88bb4d505'
            'df4fe09e68d533f64744af7ea6059f8d8ad68bff8471b91c682944bb2bb91978')

build() {
	cd spatial-media
	python setup.py build
}

package() {
	cd spatial-media
	python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
	install -Dm755 "${srcdir}/spatialmedia.sh" "${pkgdir}/usr/bin/spatialmedia"
}
