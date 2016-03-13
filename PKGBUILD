# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-format_spec_file
pkgver=20160202
pkgrel=1
_pkgver=1.3
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://build.opensuse.org/package/show/openSUSE:Factory/obs-service-format_spec_file'
#url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL2')
depends=('obs-service-source_validator')
source=("http://download.opensuse.org/source/factory/repo/oss/suse/src/${pkgname}-${pkgver}-${_pkgver}.src.rpm")
sha256sums=('1c3adbbea5a93ffe67d80af1fcce07927fbd866db62db0e8422ccfb63ddaad42')

prepare() {
  cd "$srcdir"
  tar -xf "$pkgname-$pkgver.tar.bz2"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/lib/obs/service/format_spec_file.files"
  install -m755 format_spec_file "$pkgdir/usr/lib/obs/service/"
  install -m644 format_spec_file.service "$pkgdir/usr/lib/obs/service/"
  install -m755 prepare_spec patch_license \
	  "$pkgdir/usr/lib/obs/service/format_spec_file.files/"
  install -m644 licenses_changes.txt \
	  "$pkgdir/usr/lib/obs/service/format_spec_file.files/"
}
