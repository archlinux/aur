# Contributor: Morteza NourelahiAlamdari <m@0t1.me>

pkgname=typedb-server
_pkgname=typedb
pkgver=2.18.0
pkgrel=1
pkgdesc="TypeDB: a strongly-typed database (server package)"
arch=('i686' 'x86_64')
url="https://github.com/vaticle/${_pkgname}"
license=('AGPL-3.0')
depends=('jre-openjdk')
source=("https://github.com/vaticle/${_pkgname}/releases/download/${pkgver}/${pkgname}-linux-${pkgver}.tar.gz")
sha256sums=('a780944a1f2c79d6b388733a55f72e782c9d1e9d9034780a401fca316233f326')
_dirname="${pkgname}-linux-${pkgver}"

package() {
  mkdir -p "${pkgdir}/opt/typedb-server"
  for item in LICENSE server typedb; do
    cp -r "${srcdir}/${_dirname}/${item}" "${pkgdir}/opt/typedb-server/"
  done
  install -Dm755 "${srcdir}/${_dirname}/typedb" "$pkgdir/usr/bin/typedb-server"
  install -Dvm644 "${srcdir}/${_dirname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
