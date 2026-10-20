# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=bash-autosuggestions-git
_pkgname=bash-autosuggestions
pkgver=r1.9267715
pkgrel=1
pkgdesc='IDE-style type-ahead completion for Zsh'
arch=('any')
url='https://github.com/yogeek/bash-autosuggestions'
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")

depends=('git' "bash")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $srcdir/$pkgname
	install -Dm 755 bash-autosuggestions.sh ${pkgdir}/usr/share/bash-autosuggestions/bash-autosuggestions
	install -Dm644 LICENSE -t "pkgdir/usr/share/licenses/$pkgname"
}
