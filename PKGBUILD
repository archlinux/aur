# Contributor: Myt1 <MYT1 @ QQ.com>

pkgname=fcitx5-pinyin-sougou-dict
pkgver=20250105
pkgrel=1
pkgdesc="Fcitx5-pinyin搜狗官网词库全部词量"
arch=('any')
url="https://pinyin.sogou.com/dict/"
license=('custom')
makedepends=('libime' 'fcitx5-chinese-addons')
source=(
	"build.sh"
	"${pkgname}-${pkgver}.tar.gz::https://github.com/maoyaotang12/sougouscel/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('2c85fadddebf88e4ab7663d8c22b03e997e91ca6b03389a6cc331c03e3721ed1'
            'ee5a1be25691b490a1a45f6819fa51862d079123d65bcf417775095bf31bdf9f')

build() {
	chmod +x "${srcdir}/build.sh";
	"${srcdir}/build.sh" "${srcdir}/sougouscel-20250105/scel"
}

package() {
	install -Dm644 "build/sogou-input-dict.dict" -t "${pkgdir}/usr/share/fcitx5/pinyin/dictionaries/"
}
