# Maintainer: Ramiro Magno <ramiro dot magno at gmail.com>
# Contributor:
pkgname=shapeit4
pkgver=4.2.2
pkgrel=1
pkgdesc="Segmented HAPlotype Estimation and Imputation Tools"
arch=('i686' 'x86_64')
url="https://odelaneau.github.io/shapeit4/"
license=('MIT')
depends=('zlib' 'bzip2' 'xz' 'glibc')
makedepends=('boost' 'htslib' 'gcc>=5.0.0')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/odelaneau/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz" "shapeit4.patch")
noextract=()
sha256sums=("9f109e307b5cc22ab68e7bf77de2429a9bbb2212d66303386e6a3dd81a5bc556" "b380dfeac4a28af4877d5f3f534864bd4c5090ed59f27c4da36c40bd18448457")
validpgpkeys=()

prepare() {
  patch -p0 -i "shapeit4.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/shapeit4.2 "${pkgdir}/usr/bin/shapeit4"
	install -Dm755 tools/bingraphsample/bin/bingraphsample "${pkgdir}/usr/bin/bingraphsample"
}

