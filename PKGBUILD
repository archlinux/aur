# Maintainer: Gabriel Hansson <gabrielhansson00 at gmail dot com>
pkgname=git-conflict-git
pkgver=r15.d002313
pkgrel=1
pkgdesc="Check which open pull requests conflict with local branch."
arch=('any')
url="https://github.com/gibbz00/conflict"
license=('MIT')
depends=('jq' 'ripgrep' 'github-cli')
makedepends=('git')
install=git-conflict.install
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 755 git-conflict.sh "$pkgdir/usr/bin/git-conflict.sh"
}
