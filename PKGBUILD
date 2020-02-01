# Maintainer: Pawel Dzieciolowski <dzieciolowski dot pawel at gmail dot com>
pkgname=jetbrains-mono-fonts
pkgver=1.0.2
pkgrel=1
pkgdesc="JetBrains Mono. A typeface for developers."
arch=(any)
url="https://www.jetbrains.com/lp/mono/"
license=("apache")
depends=()
makedepends=()
source=("https://download.jetbrains.com/fonts/JetBrainsMono-$pkgver.zip")
sha256sums=('59f9b9762d5625eb438eedf034dbbcdcf09ed18ded994540b466872840229762')

package() {
	cd "$srcdir/JetBrainsMono-$pkgver"
	_font_type=(ttf web/eot web/woff web/woff2)
	for type in "${_font_type[@]}"; do
		install -d "$pkgdir/usr/share/fonts/${pkgname}/$type" -m755
		install -t "$pkgdir/usr/share/fonts/${pkgname}/$type" -m644 ./$type/*
	done
}

post_install() {
	fc-cache
}
