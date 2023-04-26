# Maintainer: George Woodall <georgewoodall82@gmail.com>
pkgname=tgpt-git
pkgver=1.2.1.r4.g017a9e4
pkgrel=1
pkgdesc="ChatGPT in terminal without needing API keys"
arch=("x86_64" "aarch64" "i386" "i686")
url="https://github.com/aandrew-me/tgpt"
license=('GPL-3.0')
makedepends=('go' 'git')
source=("tgpt::git+https://github.com/aandrew-me/tgpt.git")
conflicts=('tgpt-bin' 'tgpt')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/tgpt"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/tgpt"
    go build
}

package() {
    cd "${srcdir}/tgpt"
    GOBIN="${pkgdir}/usr/bin/" go install
}
