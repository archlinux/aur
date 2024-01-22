pkgname=plymouth-theme-arch-os
pkgver=r25.f24df47
pkgrel=1
pkgdesc="Arch OS Theme for Plymouth"
arch=('any')
url="https://github.com/murkl/plymouth-theme-arch-os"
license=('GPL2')
depends=('plymouth' 'cantarell-fonts')
makedepends=('git')
source=($pkgname::git+https://github.com/murkl/plymouth-theme-arch-os.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}/src"
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/arch-os"
	install -Dvm644 ./* "${pkgdir}/usr/share/plymouth/themes/arch-os"
}

