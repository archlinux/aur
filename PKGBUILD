# Maintainer: David J. Allen <allend@lanl.gov>
pkgname=configurator
pkgver=v0.2.1
pkgrel=1
pkgdesc="An extensible tool to dynamically generate config files from SMD with Jinja 2 templating support."
arch=("x86_64")
url="https://github.com/OpenCHAMI/configurator"
license=('MIT')
groups=("openchami")
provides=('configurator')
conflicts=('configurator')
source_x86_64=("${url}/releases/download/${pkgver}/${pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('b0b45ca438b04cfc51da1758f965e46c2b5369f26d4f11e58666b65c2eb1932d')
sha256sums_aarch64=('9d4eb3115888486549f49c580dea6d72b81ae5f9a13908f873c607eb735de5de')

# we don't need to set pkgver just yet for the pre-release version...
# pkgver() {
# 	cd "$srcdir" || exit
# 	printf "%s" "$(git describe --tags --abbrev=0)"
# }

package() {
  cd "$srcdir/" || exit

  # install the binary to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  install -m755 configurator "${pkgdir}/usr/bin/configurator"

  # install plugins to /usr/lib
  install -m755 *.so "${pkgdir}/usr/lib/${pkgname}"
}
