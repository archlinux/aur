# Maintainer: Wu Xiaotian <xiaotian.wu@i-soft.com.cn>
pkgname=bash-pinyin-completion
pkgver=r18.66c9ba5
pkgrel=1
pkgdesc="complete path name based upon the pinyin acronym of Chinese characters"
arch=(x86_64)
url="https://github.com/emptyhua/bash-pinyin-completion"
license=('GPL')
depends=('bash-completion')
makedepends=('gcc' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('bash-pinyin-completion::git+https://github.com/emptyhua/bash-pinyin-completion.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
