# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=tgpt
pkgver=1.2.1
pkgrel=1
pkgdesc="ChatGPT in terminal without needing API keys"
arch=("x86_64" "aarch64" "i386" "i686")
url="https://github.com/aandrew-me/tgpt"
license=('GPL-3.0')
makedepends=('go' 'git')
source=("tgpt-${pkgver}.tar.gz::https://github.com/aandrew-me/tgpt/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

#pkgver() {
#	cd "$srcdir"
#	rm -rf tgpt
#	git clone --no-checkout https://github.com/aandrew-me/tgpt
#	cd tgpt
#	git describe --tags --abbrev=0 | sed 's/^v//'
#}

build() {
    cd "$srcdir"
    rm -rf tgpt-$pkgver
    tar xvzf tgpt-$pkgver.tar.gz
    cd tgpt-$pkgver
}

package() {
    cd "${srcdir}/tgpt-${pkgver}"
    GOBIN="${pkgdir}/usr/bin/" go install
}
