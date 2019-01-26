# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Test URL: https://www.isign.io/chrome-extension-verify
pkgname=dokobit-plugin
pkgver=1.3.1.0
pkgrel=1
pkgdesc="Google Chrome & Mozilla native smartcard plugin for Dokobit (previously called isign-chrome-signing)"
url="https://www.dokobit.com/downloads"
depends=(openssl-1.0 qt5-base)
provides=(isign-chrome-signing=$pkgver)
replaces=(isign-chrome-signing)
conflicts=(isign-chrome-signing)
arch=(i686 x86_64)
source_i686=("https://www.dokobit.com/repo/${pkgver%.*}/dokobit-plugin-en-32_${pkgver}.deb")
source_x86_64=("https://www.dokobit.com/repo/${pkgver%.*}/dokobit-plugin-en_${pkgver}.deb")
sha256sums_i686=('e84e10af1ff99bd0b63ca8b00e8b090d202c121fb7347a6d86f90ffd59b22aa1')
sha256sums_x86_64=('6f3d62e0125a1201a11e55512ccf553e0846ce11a4ca12b916c7d665e60459fe')

prepare() {
	bsdtar xf data.tar.xz
}

package() {
	cp -av etc usr "$pkgdir"
	# OCD
	chmod -x "$pkgdir"/usr/share/*/*.json
}
