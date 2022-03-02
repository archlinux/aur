# Maintainer: wzy <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo='LuRsT/hr'
_source_type='github-tags'
_upstreamver='1.3'
_pkgname=${_repo##*/}

pkgname=$_pkgname-bash
pkgver=$_upstreamver
pkgrel=1
pkgdesc='A horizontal ruler for your terminal'
arch=('any')
url="https://github.com/$_repo"
license=('MIT')
provides=("$_pkgname-$pkgver")
conflicts=("$_pkgname-$pkgver")
source=("$_pkgname-${pkgver}::$url/archive/${pkgver}.tar.gz")
sha256sums=('258ff3121369d17c5c70fa18e466ac01cdb4cf890c605f7a5e706d5b1a3afebf')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	# https://github.com/LuRsT/hr/pull/61
	# make PREFIX="$pkgdir/usr" install
	install -D "$_pkgname" -t "$pkgdir/usr/bin"
	gzip "$_pkgname.1"
	install -D "$_pkgname.1.gz" -t "$pkgdir/usr/share/man/man1"
}
