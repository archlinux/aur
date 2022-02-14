# Maintainer: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=typedb
_pkgname=typedb-all
pkgver=2.6.3
pkgrel=1
pkgdesc="TypeDB: a strongly-typed database"
arch=('i686' 'x86_64')
url="https://github.com/vaticle/${pkgname}"
license=('AGPL-3.0')
makedepends=()
depends=('jre-openjdk')
source=("https://github.com/vaticle/${pkgname}/releases/download/${pkgver}/${_pkgname}-linux-${pkgver}.tar.gz")
sha256sums=('cd7e35839d0ac1dc1c2ea2ca3956a61b13b4022fd9cb40052409e7aa8effa400')
_dirname="$pkgname-all-linux-$pkgver"

package() {
  mkdir -p "${pkgdir}/opt/typedb"
  for item in console LICENSE server typedb; do
    cp -r "${srcdir}/${_dirname}/${item}" "${pkgdir}/opt/typedb/"
  done
  install -Dm755 "${srcdir}/${_dirname}/typedb" "$pkgdir/usr/bin/typedb"
  install -Dvm644 "${srcdir}/${_dirname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
