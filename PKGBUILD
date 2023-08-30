# Maintainer: Julio Missao <jmissao at pm dot me>

pkgname=alloydb-cli-bin
pkgver=1.0_1
pkgrel=1
pkgdesc="AlloyDB Omni command-line tool."
arch=('x86_64')
url="https://cloud.google.com/alloydb/docs/omni/omni-cli"
license=('custom:alloydb-omni')
#install=alloydb-cli-bin.install
_md5sum=ada3f334a55282ba22f69181cf9b8041
source_x86_64=("https://us-apt.pkg.dev/projects/alloydb-omni/pool/alloydb-omni-apt/alloydb-cli_${pkgver//_/-}_amd64_${_md5sum}.deb")
sha256sums_x86_64=('33abcdf8cfaac75c92e502ac2f9654e238be8835e7104462dbba4eed3cafe196')

package() {
    bsdtar -O -xf *.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
    install -Dm644 "$pkgdir"/usr/share/doc/alloydb/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
