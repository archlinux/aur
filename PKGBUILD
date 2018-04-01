_servicename=format_spec_file
pkgname=obs-service-${_servicename}-git
pkgver=r120.402059d
pkgrel=1
pkgdesc='An OBS source service: reformats a spec file to SUSE standard'
arch=('any')
url='https://github.com/openSUSE/obs-service-format_spec_file'
license=('GPL2')
depends=('obs-service-source_validator' 'perl-timedate')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/openSUSE/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
