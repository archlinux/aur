# Contributor: Techlive Zheng <techlivezheng@gmail.com>
# Maintainer: TingPing <tingping@tingping.se>

_gitname=git-bz
pkgname=git-bz-git
pkgver=r169.e17bbae
pkgrel=1
pkgdesc='Bugzilla subcommand for Git'
arch=('any')
url='http://blog.fishsoup.net/2008/11/16/git-bz-bugzilla-subcommand-for-git/'
license=('GPL2')
depends=('git' 'python2')
optdepends=('python2-crypto: Support for Chrom[e|ium] cookies')
makedepends=('xmlto'  'asciidoc')
source=('git://git.fishsoup.net/git-bz')
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_gitname"

	./configure --prefix=/usr
	make
}

package() {
	cd "$_gitname"

	DESTDIR="$pkgdir" make install
}
