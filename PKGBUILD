# Maintainer: David J. Allen <allend@lanl.gov>
pkgname=configurator
pkgver=v0.1.0alpha
pkgrel=1
pkgdesc="An extensible tool to dynamically generate config files from SMD with Jinja 2 templating support."
arch=("x86_64")
url="https://github.com/OpenCHAMI/configurator"
license=('MIT')
groups=("openchami")
provides=('configurator')
conflicts=('configurator')
source_x86_64=(
	"${url}/releases/download/v0.1.0-alpha/${pkgname}.tar.gz"
)
sha256sums_x86_64=('28e10f1e39757bbdc3a503de74dd4d8c610d9c78e89665fb42012e8ef7834d0f')

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
