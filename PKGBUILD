# Note: NCBI retired tbl2asn; table2asn is its official successor.
# https://ftp.ncbi.nlm.nih.gov/asn1-converters/by_program/table2asn/

pkgname=table2asn
pkgver=1.29.324
pkgrel=1
pkgdesc="NCBI tool that converts 5-column feature tables into ASN.1 for GenBank submission (successor to tbl2asn)"
arch=('x86_64')
url="https://www.ncbi.nlm.nih.gov/genbank/tbl2asn2/"
license=('Public Domain')
depends=('sqlite')
options=('!strip' '!debug')
# NCBI ships a single gzipped ELF binary (inner name 'linux64.table2asn');
# the upstream filename is unversioned, so we rename it with the version.
source=("table2asn-${pkgver}.gz::https://ftp.ncbi.nlm.nih.gov/asn1-converters/by_program/table2asn/linux64.table2asn.gz")
sha256sums=('785bed9880856b208ed84d9765ca094b7c7d12d2225781c2a1854b650d3984bf')
noextract=("table2asn-${pkgver}.gz")

package() {
    cd "$srcdir"
    gunzip -c "table2asn-${pkgver}.gz" > table2asn
    install -Dm755 table2asn "$pkgdir/usr/bin/$pkgname"
}
