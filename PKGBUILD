# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=kuvasz-streamer-bin
pkgver=1.21.3
pkgrel=1
pkgdesc="Postgres-to-Postgres data consolidation and change data capture"
arch=('x86_64' 'aarch64')
url="https://github.com/kuvasz-io/kuvasz-streamer"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/kuvasz-streamer_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/kuvasz-streamer_Linux_arm64.tar.gz")
sha256sums_x86_64=('aac4e56e47ee7241f387607e82b7286155e5e5b32e460356ec3f85945c3c9367')
sha256sums_aarch64=('ed60e751b7bd4b8ab7bb0eeae4332ed1dda7ab8a39978f55ae3f567bdd07424d')

package() {
  install -Dm755 "kuvasz-streamer" "${pkgdir}/usr/bin/kuvasz-streamer"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
