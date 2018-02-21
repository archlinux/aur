# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-format_spec_file
pkgver=20171107
pkgrel=1
_pkgver=1.1
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://build.opensuse.org/package/show/openSUSE:Factory/obs-service-format_spec_file'
#url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL2')
depends=('obs-service-source_validator' 'perl-date-parse')
source=("http://download.opensuse.org/source/factory/repo/oss/suse/src/${pkgname}-${pkgver}-${_pkgver}.src.rpm")
sha256sums=('3e47e50921066d1cc139ba2e17fc1b26a44e481ae3cb07f8e97b710be32c343e')

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
