# Maintainer: Sophie Tauchert <sophie@999eagle.moe>

pkgname=playlist-sync
pkgver=0.1.0
pkgrel=2
pkgdesc="Tool to sync playlists between music folders."
arch=('any')
url="http://gitlab.com/999eagle/playlist-sync"
license=('GPL3')
depends=('python' 'python-m3u8')
makedepends=('python-setuptools')
provides=()
source=("https://gitlab.com/999eagle/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('9bbb19561eef3a4e978b6238605f29ea33062073bc449f78d1a6f028bcf196ad')

build() {
	cd "${pkgname}-v${pkgver}"
	python -c "from setuptools import setup; setup()" build
}

package() {
	cd "${pkgname}-v${pkgver}"
	python -c "from setuptools import setup; setup()" install --root="$pkgdir/" --optimize=1 --skip-build
}
