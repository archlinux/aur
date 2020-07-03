# Maintainer: Max Briggs <max@maxbriggs.org>
pkgname=otf-gt40
pkgver=1
pkgrel=1
pkgdesc='A free recreation of the GT 40 Mono Font by Kate Willaert'
url='https://archive.org/download/gt-40-mono-font/GT40%20Mono%20Font.zip'
license=('custom')
arch=('any')
source=("${pkgname}-${pkgver}.zip::$url")
sha256sums=('0bbf729c7bba82ecc7646d1f96f88236e79e00efff09393489e205be1554fee5')

build() {
	sed -n '/This recreation/p' "GT40 Mono README.txt" > LICENSE
}

package() {
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	install -Dm644 "GT40 Mono.otf" "$pkgdir/usr/share/fonts/OTF/GT40 Mono.otf"
	install -Dm644 "GT40 Mono Italic.otf" "$pkgdir/usr/share/fonts/OTF/GT40 Mono Italic.otf"
}
