# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=xvolkolak
pkgver=0.21
pkgrel=2
pkgdesc="Xvolkolak is an unpacker emulator"
arch=(x86_64)
url="http://n10info.blogspot.com/"
license=(custom)
depends=(glibc)
# official source below
#source=('https://www.dropbox.com/s/5p3qflue2wmu9m7/xvlk_lin64_public_0.21.tar.gz?dl=1')
source=("http://libpcap.net/xvolkolak/xvlk_lin64_public_0.21.tar.gz")
install="$pkgname.install"
sha256sums=('9c2a704c0134528e9259e414ad5c5d301e637a71f441709bbcd5cb366fc2577a')

package() {
	mkdir -p "$pkgdir/usr/share/xvolkolak" "$pkgdir/usr/bin"

	cp -a "${srcdir}/xvlk_lin64_public/base" "$pkgdir/usr/share/xvolkolak/"

	cp -a "${srcdir}/xvlk_lin64_public/xvlkc.sh" \
		"${srcdir}/xvlk_lin64_public/xvlk.sh" "$pkgdir/usr/bin/"

	sed -i -re 's|./base|/usr/share/xvolkolak/base|g' "${pkgdir}"/usr/bin/*.sh
}
