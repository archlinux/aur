# Maintainer: wzy <wuzy01@qq.com>
# Helper variables for updaurpkg
# https://aur.archlinux.org/packages/updaurpkg-git
_repo='benlinton/slugify'
_source_type='github-tags'
_upstreamver='v1.0.1'
_pkgname=${_repo##*/}

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc='Bash command that converts filenames and directories to a web friendly format.'
arch=('any')
url="https://github.com/$_repo"
license=('MIT')
source=("$_pkgname-$pkgver::$url/archive/$_upstreamver.tar.gz")
sha256sums=('f6873b062119d3eaa7d89254fc6e241debf074da02e3189f12e08b372af096e5')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -D slugify -t "$pkgdir/usr/bin"
	gzip slugify.1
	install -D slugify.1.gz -t "$pkgdir/usr/share/man/man1"
}
