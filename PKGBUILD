# Maintainer: Yufan You <ouuansteve at gmail.com>

pkgname=noi-despised-git
pkgver=r31.70aa9e3
pkgrel=1
pkgdesc='NOI 背笔试工具'
arch=('x86_64')
url='https://github.com/ouuan/Despised'
license=('MIT')
makedepends=('git')
provides=('noi-despised')
conflicts=('noi-despised')
source=('git://github.com/ouuan/Despised.git')
md5sums=('SKIP')

pkgver() {
	cd Despised
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd Despised
	g++ main.cpp -o despised -std=c++11
}

package() {
	install -Dm755 "Despised/despised" "$pkgdir/usr/bin/despised"
}
