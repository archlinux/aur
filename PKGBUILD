# Maintainer: Gustavo Vinícios de Souza <gnsfujiwara@disroot.org>

pkgname=adbren-git
pkgver=r58.12bee5b
pkgrel=1
pkgdesc='Rename and organize anime using this AniDB API client written in perl'
arch=('any')
url="https://github.com/clip9/${pkgname%-git}"
license=('custom:none')
depends=('perl' 'perl-digest-md4' 'perl-file-homedir' 'perl-file-pid')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=('adbren')
source=("${pkgname%-git}::git+https://github.com/clip9/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm755 "$srcdir/${pkgname%-git}/adbren.pl" "$pkgdir/usr/bin/adbren"
}
