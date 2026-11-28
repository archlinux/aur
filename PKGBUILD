# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pg_hardstorage-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="PostgreSQL backup with continuous WAL streaming and base backups"
arch=('x86_64' 'aarch64')
url="https://github.com/cybertec-postgresql/pg_hardstorage"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pg_hardstorage_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pg_hardstorage_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('81999bae901ed432bb53cfb520b6daadd025af12c1a897f2a811516c1798525b')
sha256sums_aarch64=('2d53b1fee58627cc82432f186bd2a5d818edf443ff7f8f5c760f439633983703')

package() {
  install -Dm755 "pg_hardstorage" "${pkgdir}/usr/bin/pg_hardstorage"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
