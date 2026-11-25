# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=evernote-backup-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Backup & export all Evernote notes and notebooks"
arch=('x86_64' 'aarch64')
url="https://github.com/vzhd1701/evernote-backup"
license=('MIT')
depends=('glibc' 'zlib')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vzhd1701/evernote-backup/${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/bin_evernote_backup_${pkgver}_linux_x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/bin_evernote_backup_${pkgver}_linux_arm64.tar.gz")
sha256sums=('115d2d0b465b5bb874ec9a26def6b63839532dcec1a2ce84f7cca66de974089c')
sha256sums_x86_64=('f03c3aa9777e679adb8923309591d85b311a5528f4d684ef1375d9170f2c60f4')
sha256sums_aarch64=('59317b8d82a219a1ab2a9cbdeb7f07f0981d0ad1e1c10f07ca0df5ca5e3f6211')

package() {
  install -Dm755 "evernote-backup" "${pkgdir}/usr/bin/evernote-backup"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
