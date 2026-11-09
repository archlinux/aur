# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
#
# Based on the upstream PKGBUILD:
# https://build.opensuse.org/projects/openSUSE:Factory/packages/obs-service-format_spec_file/files/PKGBUILD?expand=1
#
# Pull requests are welcome on GitHub: https://github.com/yurikoles-aur/obs-service-format_spec_file
#

pkgname=obs-service-format_spec_file
_pkgver=20260320
_subpkgver=2.2
pkgver="${_pkgver}.${_subpkgver}"
_susepkgver="${_pkgver}-${_subpkgver}"
pkgrel=1
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL-2.0-only')
depends=('obs-service-source_validator')
source=("https://download.opensuse.org/source/tumbleweed/repo/oss/src/${pkgname}-${_susepkgver}.src.rpm")
sha256sums=('84b9aa6acc4d5190083f32c4feb815c85a1052e02de78cb83c137090704148db')

prepare() {
  bsdtar -xf "${pkgname}-${_pkgver}.tar.bz2"
}

package() {
  cd "${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
}
