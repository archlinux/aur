# Maintainer: Roman Beslik <rabeslik@gmail.com>
pkgname=azardi
pkgver=25.0
pkgrel=1
arch=("x86_64" "i686")
url="http://azardi.infogridpacific.com/"
makedepends=("deb2targz")
pkgdesc="The AZARDI book reader by Infogrid Pacific Pte Ltd."
if [ "$CARCH" = "x86_64" ]; then
	_arch_file_name=amd64
	sha512sums=(c8286aad8cab7b38d3b421bfe02ff24fd4785bf5f315a9cb1693a50031bfd4720260cf6f7c19e6b9746691dd43f233ee1fcadefe8e5c1ffcc420ecc92f943f8c)
fi
if [ "$CARCH" = "i686" ]; then
	_arch_file_name=i386
	sha512sums=(1da574118b6aca40ea8878df07f295e5b80d10ccaa46da392c4be4631009736feb4623fe35d639f0a1846544b9fa69d976295e2c105e9edd0a2e08a64796717c)
fi
_deb_file_name=AZARDI_${pkgver}_20131113_${_arch_file_name}
source=(https://azardi-download.s3.amazonaws.com/${_deb_file_name}.deb)
license=("custom:azardi")
install=_.install
build() {
	deb2targz $srcdir/${_deb_file_name}.deb
}
package() {
	tar -xzvf $srcdir/${_deb_file_name}.tar.gz -C $pkgdir
}
