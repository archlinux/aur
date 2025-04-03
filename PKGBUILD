#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
pkgname="swf_animation"
pkgver=1.1.0
pkgrel=1
pkgdesc="A command line tool for extracting Adobe flash animations"
arch=('any')
url="https://github.com/aojiaoxiaolinlin/swf_animation"
license=('MIT', 'Apache')
makedepends=('cargo')
source=("https://github.com/aojiaoxiaolinlin/swf_animation/archive/refs/tags/V${pkgver}.zip")
sha256sums=('c68b396dbf7edabfa0b6d1af96a1f63cd7dfc71ff17fd3e226eb5c843c118660')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build -r
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/swf_to_json" "$pkgdir/usr/bin/swf_to_json"
}
