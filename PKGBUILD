# Maintainer: Igor Belov <ivbelov at gmail>

pkgname=pg_timetable
pkgver=5.7.0
pkgrel=1
pkgdesc='An advanced job scheduler for PostgreSQL'
url='https://github.com/cybertec-postgresql/pg_timetable'
license=('custom')
arch=('i686' 'x86_64' 'aarch64')
source_x86_64=("https://github.com/cybertec-postgresql/pg_timetable/releases/download/v$pkgver/pg_timetable_Linux_x86_64.tar.gz")
source_i686=("https://github.com/cybertec-postgresql/pg_timetable/releases/download/v$pkgver/pg_timetable_Linux_i386.tar.gz")
source_aarch64=("https://github.com/cybertec-postgresql/pg_timetable/releases/download/v$pkgver/pg_timetable_Linux_arm64.tar.gz")
sha256sums_i686=('96b2f5bd5910fe6d4a151b22a9d3299ee2788cd1151ddd0eb6ef9a69de5af28d')
sha256sums_x86_64=('a207f4693df6f34033a526bf3397d4c002d8a5cff7bae64fb8a3a1eb038669ea')
sha256sums_aarch64=('e0dde0f82d2ecd4cb4feedcffd4562f34a20e5052c75aded80c0a1dfd87e2793')

options=(!strip)

package() {
  # Copy license to license directory
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" pg_timetable_Linux_*/LICENSE

  # Install the program.
  install -Dm755 pg_timetable_Linux_*/pg_timetable "${pkgdir}/usr/bin/pg_timetable"
}