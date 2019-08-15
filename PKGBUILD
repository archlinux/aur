 # By tejonaco
 _pkgname=plymouth-theme-arch-agua
pkgname="${_pkgname}"
pkgver=r4.f7789af
pkgrel=1
pkgdesc='Plymouth theme for Arch Linux inspired by Deepin.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/tejonaco/${_pkgname}/"
license=('GNU')
install="${pkgname}.install"
depends=('plymouth')
makedepends=('git')
source=("git+https://github.com/tejonaco/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/arch-logo"
	rm -fv *~
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/arch-logo"
	install -Dvm644 * "${pkgdir}/usr/share/plymouth/themes/arch-logo"
}

