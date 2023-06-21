# Maintainer: Josh Mak <jmak2015@gmail.com>
# Co-Maintainer: N.Pranav Krishna <npranav7619@gmail.com>
pkgname=mya-git
pkgver=r134.587fa4f
pkgrel=1
pkgdesc="A CLI tool for fetching data from MyAnimeList"
arch=('x86_64')
url="https://github.com/jmakhack/myanimelist-cli/tree/master"
license=('MIT')
depends=('libcurl-compat' 'json-c' 'libbsd')
makedepends=('git' 'gcc' 'curl')
source=("mya-git::git+https://github.com/jmakhack/myanimelist-cli.git")
md5sums=('SKIP')

pkgver(){
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
	cd "$pkgname"
	make	
}
package(){
	cd "$pkgname"
	install -Dm755 "./bin/mya" "$pkgdir/usr/bin/mya"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname"
}
