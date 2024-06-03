# Maintainer: Théo Grivel <grivel * theo at protonmail * com>
pkgname=webserv
pkgver=0
pkgrel=2
pkgdesc="This is a web server written in C++98 from a student project"
url="https://github.com/t-h2o/webserv"
_gitname=webserv
depends=('gcc')
makedepends=('make' 'git')
arch=(x86_64)
license=('custom')
source=("git+https://github.com/t-h2o/webserv")
sha256sums=('SKIP')

prepare() {
	cd "$_gitname"

}
build() {
	cd "$_gitname"
	make
}
package() {
	cd "$_gitname"
	install -Dm755 webserv "$pkgdir/usr/bin/webserv"
	install -Dm644 man/webserv.8.gz "$pkgdir/usr/share/man/man8/webserv.8.gz"
}
