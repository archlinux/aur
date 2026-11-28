# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=pgsqlite-bin
pkgver=0.0.22
pkgrel=1
pkgdesc="PostgreSQL protocol adapter for SQLite databases"
arch=('x86_64' 'aarch64')
url="https://github.com/erans/pgsqlite"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/erans/pgsqlite/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/pgsqlite-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/pgsqlite-linux-arm64.tar.gz")
sha256sums=('acd34784810d12a656fca2173ba8e0256d91f24037c205932193be75157d2db8')
sha256sums_x86_64=('b7cad35e1f2d73e651582f610ae998abe3a6e7d25d79fe7b930f6d389c7298cf')
sha256sums_aarch64=('93e86addd0cfc8963afd7738d7c16e7df9e45704f8c5fc080470a68c50b81bd7')

package() {
  install -Dm755 "pgsqlite" "${pkgdir}/usr/bin/pgsqlite"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
