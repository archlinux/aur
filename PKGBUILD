# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=tv_grab_zz_sdjson_sqlite-git
pkgver=r73.0d8b09d
pkgrel=1
pkgdesc="XMLTV grabber for Schedules Direct JSON service"
arch=('any')
url='https://github.com/garybuhrmaster/tv_grab_zz_sdjson_sqlite'
license=('GPL')
makedepends=('git')
source=("git+https://github.com/garybuhrmaster/tv_grab_zz_sdjson_sqlite.git")
sha256sums=('SKIP')
depends=('perl-file-which' 'perl-file-homedir' 'perl-json-xs' 'perl-datetime-format-sqlite'
         'perl-list-moreutils-xs' 'perl-exporter-tiny' 'perl-list-moreutils'
         'perl-dbd-sqlite' 'perl-lwp-useragent-determined' 'perl-time-hires')
conflicts=('tv_grab_zz_sdjson_sqlite')
provides=('tv_grab_zz_sdjson_sqlite')

pkgver() {
  cd "tv_grab_zz_sdjson_sqlite"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/tv_grab_zz_sdjson_sqlite"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/tv_grab_zz_sdjson_sqlite"
  install -d "${pkgdir}/usr/share/doc/tv_grab_zz_sdjson_sqlite"
  install -m755 tv_grab_zz_sdjson_sqlite "${pkgdir}/usr/bin/"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/tv_grab_zz_sdjson_sqlite/"
  install -m644 README.md "${pkgdir}/usr/share/doc/tv_grab_zz_sdjson_sqlite/"
  install -m644 fixups.txt "${pkgdir}/usr/share/doc/tv_grab_zz_sdjson_sqlite/"
}

# vim:set ts=2 sw=2 et:
