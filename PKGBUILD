# Hi-Tech-arch-animation PKGBUILD

pkgname=hitech-arch-animation
pkgver=r5.f23db66
pkgrel=1
pkgdesc="Hi-Tech Arch Linux Plymouth Theme"
arch=('any')
url="https://github.com/xDeFc0nx/HiTech-arch-animation"
license=('GPL-3.0-or-later')
depends=('plymouth')
makedepends=('git')
source=("$pkgname::git+${url}.git#commit=f23db665d74599510e827131956bfb04bcc6d742")
sha256sums=('a24b14fc0b659cbb80c0ae5b5516f05ca0625d156a319ad2c533bd404be12e82')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/plymouth/themes/$pkgname/" \
		arch.plymouth animated-boot.script *.png
}
