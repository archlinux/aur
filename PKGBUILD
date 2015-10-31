# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=obs-service-download_files
pkgver=0.5
pkgrel=2
_pkgrel=3.1.2
pkgdesc='An OBS source service: downloads all remote sources listed in a spec file'
arch=('any')
url='https://github.com/openSUSE/obs-service-download_files'
license=('GPL2')
depends=('obs-build-git' 'diffutils' 'wget' 'perl-uri')
source=("http://download.opensuse.org/source/distribution/13.1/repo/oss/suse/src/${pkgname}-${pkgver}-${_pkgrel}.src.rpm")
sha256sums=('ce2f8ba0746a0cea6a7db3633f3584f14753ff739ea33c38c357112de10f9dd6')

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/usr/lib/obs/service/"
  install -m755 download_files "$pkgdir/usr/lib/obs/service/"
  install -m644 download_files.service "$pkgdir/usr/lib/obs/service/"
  mkdir -p "$pkgdir/etc/obs/services"
  install -m644 download_files.rc "$pkgdir/etc/obs/services/download_files"
  mkdir -p $pkgdir/var/cache/obs/download_files/file{,name}
}

# vim:set ts=2 sw=2 et:
