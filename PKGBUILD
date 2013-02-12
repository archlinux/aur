# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=obs-service-format_spec_file
pkgver=0.1
pkgrel=1
_rpmver=32.1
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://build.opensuse.org/package/show?package=obs-service-format_spec_file&project=openSUSE%3ATools'
license=('GPL2')
depends=('osc-source_validator')
source=("http://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Factory/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('50fa18cf7eaf4aca7e4ec10f63e1c9e7')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/lib/obs/service/format_spec_file.files
  install -m755 format_spec_file "${pkgdir}"/usr/lib/obs/service
  install -m644 format_spec_file.service "${pkgdir}"/usr/lib/obs/service
  install -m755 prepare_spec "${pkgdir}"/usr/lib/obs/service/format_spec_file.files
}
