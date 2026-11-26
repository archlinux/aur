# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=eliasdb-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Graph-based database"
arch=('x86_64')
url="https://github.com/krotik/eliasdb"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/eliasdb_v${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('0fc0f537f4f608c7d96500eaa56fb44d6a519ee6a25b8f7835966d3314d6bab6')

package() {
  install -Dm755 "eliasdb_linux_amd64/eliasdb" "${pkgdir}/usr/bin/eliasdb"
  install -Dm644 "eliasdb_linux_amd64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "eliasdb_linux_amd64/examples/tutorial/res/graphiql/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "eliasdb_linux_amd64/examples/chat/res/chat/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "eliasdb_linux_amd64/examples/chat/res/chat/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "eliasdb_linux_amd64/examples/data-mining/docker-images/eliasdb/cluster.config.json.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 "eliasdb_linux_amd64/examples/data-mining/docker-images/eliasdb/cluster.stateinfo.1" -t "${pkgdir}/usr/share/man/man1"
}
