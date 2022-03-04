# Maintainer: Matt Monaco <cx monaco matt>
# contributor: Mikhail felixoid Shiryaev <mr.felixoid na gmail com>

pkgname=vim-webapi-git
pkgver=0.3.43.gb09cbd3
pkgrel=1
pkgdesc="Vim Interface to Web API"
arch=(any)
url=https://github.com/mattn/webapi-vim
license=(Public Domain)
depends=(vim curl)
makedepends=(git)
provides=(vim-webapi)
conflicts=(vim-webapi)
source=(git+https://github.com/mattn/webapi-vim.git)
md5sums=(SKIP)
install=vim-helptags.install

pkgver()
{
	cd "$srcdir"/webapi-vim
	local ver=$(git describe --tags )
	printf "%s" "${ver//-/.}"
}

package()
{
	cd "$srcdir"/webapi-vim
	for f in autoload/webapi/* doc/* example/*; do
		install -D "$f" "$pkgdir"/usr/share/vim/vimfiles/"$f"
	done
}
