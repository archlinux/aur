# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgname="gitter-irc-bot"
_github="finnp/$_pkgname"
pkgname=$_pkgname-git
pkgver=v1.1.1.31.ga02e1c9
pkgrel=1
pkgdesc="Bot that synchronises messages from gitter and irc"
arch=("any")
url="https://github.com/$_github"
license=("MIT")
depends=("nodejs")
makedepends=("git" "npm")
source=("git+https://github.com/$_github")
sha256sums=("SKIP")


pkgver() {
	cd "$_pkgname"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$_pkgname"
	npm build
}

package() {
	cd "$_pkgname"
	npm install -g --prefix "$pkgdir/opt/node"
}
