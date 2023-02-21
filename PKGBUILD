# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=xvolkolak
pkgver=0.22
pkgrel=3
pkgdesc="Xvolkolak is an unpacker emulator"
arch=(x86_64)
url="http://n10info.blogspot.com/"
license=(custom)
depends=(glibc)
# official source below
#source=('https://www.dropbox.com/s/7sk61nc798kcg32/xvlk_lin64_public_0.22.tar.gz?dl=1')
# wget --mirror --no-parent --convert-links --directory-prefix=xvolkolak --html-extension --restrict-file-names=windows http://n10info.blogspot.com/2018/08/xvolkolak-022.html
source=("http://libpcap.net/xvolkolak/xvlk_lin64_public_${pkgver}.tar.gz")
install="$pkgname.install"
sha256sums=('4b77ce5eab33314b13b7982cffdd7526b7a8f3575945ad13aae3ec1a79d95035')

package() {
	mkdir -p "$pkgdir/usr/share/xvolkolak" "$pkgdir/usr/bin"

	cp -a "${srcdir}/xvlk_lin64_public/base" "$pkgdir/usr/share/xvolkolak/"
	cp -a "${srcdir}/xvlk_lin64_public/xvlkc.sh" \
		"${srcdir}/xvlk_lin64_public/xvlk.sh" "$pkgdir/usr/bin/"
	sed -i -re 's|./base|/usr/share/xvolkolak/base|g' "${pkgdir}"/usr/bin/*.sh
}
