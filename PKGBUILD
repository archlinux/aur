# Maintainer: Igor Belov <ivbelov at gmail>

pkgname=pg_timetable
pkgver=5.9.0
pkgrel=1
pkgdesc='An advanced job scheduler for PostgreSQL'
url='https://github.com/cybertec-postgresql/pg_timetable'
license=('custom')
arch=('i686' 'x86_64' 'aarch64')
source_x86_64=("https://github.com/cybertec-postgresql/pg_timetable/releases/download/v$pkgver/pg_timetable_Linux_x86_64.tar.gz")
source_i686=("https://github.com/cybertec-postgresql/pg_timetable/releases/download/v$pkgver/pg_timetable_Linux_i386.tar.gz")
source_aarch64=("https://github.com/cybertec-postgresql/pg_timetable/releases/download/v$pkgver/pg_timetable_Linux_arm64.tar.gz")
sha256sums_i686=('7019b5f41a065d8f53b228f87b181f1b117f92133cfa2d0e6559d700845e2ef6')
sha256sums_x86_64=('f48916c7220a35424496bc0c82608db1bbe5465536577fba87ed9585cb7c6343')
sha256sums_aarch64=('d4edf7dfd60f64fa168ba0c8bccf7e15f64e9e723e9e781eb89f23703fd869d0')

options=(!strip)

package() {
  # Copy license to license directory
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" pg_timetable_Linux_*/LICENSE

  # Install the program.
  install -Dm755 pg_timetable_Linux_*/pg_timetable "${pkgdir}/usr/bin/pg_timetable"
}