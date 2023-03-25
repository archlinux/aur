# Maintainer: Slavi Pantaleev <slavi at devture dot com>
# To report issues or contribute: https://github.com/spantaleev/PKGBUILDs

pkgname=agru
pkgver=0.1.2
pkgrel=1
pkgdesc="Ansible-Galaxy Requirements Updater - a fast ansible-galaxy replacement"
arch=('any')
url="https://gitlab.com/etke.cc/int/agru"
license=('GPL3')
depends=()
makedepends=('git' 'go')
source=('vcs-repository::git+https://gitlab.com/etke.cc/int/agru.git#tag=v'$pkgver)
md5sums=('SKIP')

build() {
	export GOPATH="$srcdir/go"

	cd "$srcdir/vcs-repository"

	go build -v -o agru .
}

package() {
	install -Dm 755 $srcdir/vcs-repository/agru $pkgdir/usr/bin/agru
}
