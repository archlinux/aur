# Maintainer: Jeremie Simard aka Case-Prudolicce <jeremie.simard.rip@gmail.com>
pkgname='hcli'
pkgver=1.0.0
pkgrel=0
pkgdesc="Habitica CLI; A Command Line Interface for Habitica"
arch=('any')
url="https://github.com/case-prudolicce/hcli"
license=('GPL')
depends=('fzf' 'curl' 'jq' 'bc')
makedepends=('git')
source=('hcli::git://github.com/case-prudolicce/hcli')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --always | sed 's/-.*$//g;s/-/./g'
}

package() {
	cd "$pkgname"
	install -Dm755 ./hcli "$pkgdir/usr/bin/hcli"
	mkdir -p "$pkgdir/usr/share/man/man1"
	install -Dm644 ./hcli.1.gz "$pkgdir/usr/share/man/man1/"
}
