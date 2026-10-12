# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=sdb-bin
_pkgname=sdb
pkgver=4.2.36
pkgrel=1
pkgdesc="Samsung Smart Development Bridge (CLI tool for Tizen OS and Samsung Smart TVs)"
arch=('x86_64')
url="https://developer.samsung.com/smarttv/develop/getting-started/using-sdk/tv-device.html"
license=('Apache-2.0' 'custom')
depends=('glibc' 'gcc-libs')
provides=('sdb')
conflicts=('sdb' 'tizen-sdb')
options=('!strip')

source=("${pkgname}-${pkgver}.zip::https://download.tizen.org/sdk/tizenstudio/official/binary/sdb_${pkgver}_ubuntu-64.zip")
sha256sums=('addf825e1a886a9f220cb3d287e74438cae0ffafe5821b9baca9d4f6c7de5124')

package() {
  install -Dm755 "${srcdir}/data/tools/sdb" "${pkgdir}/usr/bin/sdb"
  install -Dm644 "${srcdir}/data/tools/.sdb-completion.bash" "${pkgdir}/usr/share/bash-completion/completions/sdb"
}
