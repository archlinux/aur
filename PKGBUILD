# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: zzy-ac <zzy-ac@qq.com>
pkgname=fonts-noto-hinted
pkgver=20161116
pkgrel=1
pkgdesc="'No Tofu' font families with large Unicode coverage (hinted)
 Noto is a collection of font families, each visually harmonized across
 scripts."
arch=(any)
url="http://archive.debian.org/debian-archive/debian/pool/main/f/fonts-noto/"
license=('GPL')
source=("${url}/fonts-noto-hinted_${pkgver}-${pkgrel}_all.deb")
sha256sums=('a71fcee2bc7820fc4e0c780bb9c7c6db8364fd2c5bac20867c5c33eed470dc51')


prepare() {
	mkdir "$pkgname-$pkgver"
    tar -xf ${srcdir}/data.tar.xz -C "$pkgname-$pkgver"
}


package() {
	cd "$pkgname-$pkgver"
	cp -r etc ${pkgdir}
    cp -r usr ${pkgdir}
}
