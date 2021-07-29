# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=typedb
_pkgname=typedb-all
pkgver=2.3.1
pkgrel=3
pkgdesc="TypeDB: a strongly-typed database"
arch=('i686' 'x86_64')
url="https://github.com/vaticle/${pkgname}"
license=('AGPL-3.0')
makedepends=()
depends=('jre-openjdk')
source=("https://github.com/vaticle/${pkgname}/releases/download/${pkgver}/${_pkgname}-linux-${pkgver}.tar.gz")
sha256sums=('e8c2604ace4a32dfc59150f6e3319ea728f31d260b9050ffdc90bd9528369846')
_dirname="$pkgname-all-linux-$pkgver"

package() {
  mkdir -p "${pkgdir}/opt/typedb"
  for item in console LICENSE server typedb; do
    cp -r "${srcdir}/${_dirname}/${item}" "${pkgdir}/opt/typedb/"
  done
  install -Dm755 "${srcdir}/${_dirname}/typedb" "$pkgdir/usr/bin/typedb"
  install -Dvm644 "${srcdir}/${_dirname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
