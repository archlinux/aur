# Maintainer: Max Briggs <max@maxbriggs.org>
pkgname=otf-gt40
pkgver=2021
pkgrel=1
pkgdesc='A free recreation of the GT 40 Mono Font by Kate Willaert'
url='https://archive.org/download/gt-40-2021/GT40%202021.7z'
license=('custom')
arch=('any')
source=("${pkgname}-${pkgver}.7z::$url")
sha256sums=('519703dd535c233ccfc1440027522763c56dae2a2369faf7216fa77e631036b2')

build() {
	sed -n '/This recreation/p' "GT40 Mono README.txt" > LICENSE
}

package() {
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 "GT40 2021 Mono.otf" "$pkgdir/usr/share/fonts/OTF/GT40 Mono.otf"
	install -Dm644 "GT40 2021 Mono Italic.otf" "$pkgdir/usr/share/fonts/OTF/GT40 Mono Italic.otf"
}
