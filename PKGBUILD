# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=mythhdhrrecorder-git
pkgver=r29.66c216f
pkgrel=1
pkgdesc="MythTV External Recorder for the SiliconDust HDHR tuners"
arch=('any')
url='https://github.com/garybuhrmaster/mythhdhrrecorder'
license=('Apache')
makedepends=('git')
source=("git+https://github.com/garybuhrmaster/mythhdhrrecorder.git")
sha256sums=('SKIP')
depends=('python-requests' 'python-systemd')
conflicts=('mythhdhrrecorder')
provides=('mythhdhrrecorder')

pkgver() {
  cd "mythhdhrrecorder"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mythhdhrrecorder"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licenses/mythhdhrrecorder"
  install -d "${pkgdir}/usr/share/doc/mythhdhrrecorder"
  install -m755 mythhdhrrecorder "${pkgdir}/usr/bin/"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/mythhdhrrecorder/"
  install -m644 README.md "${pkgdir}/usr/share/doc/mythhdhrrecorder/"
}

# vim:set ts=2 sw=2 et:
