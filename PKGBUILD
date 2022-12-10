# Maintainer: éclairevoyant
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: Martin Ortbauer <mortbauer@gmail.com>

_pkgname=aur-comment-fetcher
pkgname="$_pkgname-git"
pkgver=r30.afef23d
pkgrel=1
pkgdesc="A simple script fetching the comments of packages in AUR"
arch=('any')
url="https://github.com/mortbauer/$_pkgname"
license=('GPL')
depends=('python-click' 'python-requests' 'python-beautifulsoup4' 'python-lxml' 'python3-aur')
makedepends=('git')
provides=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd $_pkgname
	_binname=aur-comment-fetch
	install -Dm755 $_binname -t "$pkgdir/usr/bin/"
	install -Dm644 bash_completion "$pkgdir/usr/share/bash-completion/completions/$_binname"
}
