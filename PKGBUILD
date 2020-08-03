pkgname=list
pkgver=0.0.1.r0.g8b1fe31
pkgrel=1
pkgdesc="Linux utility wrapper in bash function script to search files, and show info, dependencies etc, it'd be put in .bashrc"
arch=('any')
url="https://github.com/abdulbadii/find-and-list-file-folder-recursively"
license=('GPL3')
depends=('bash' 'findutils' 'sed' 'file' 'glibc' )
optdepends=('pcre2grep')
makedepends=('git')
provides=("list")
source=('git+https://github.com/abdulbadii/find-and-list-file-folder-recursively.git')
md5sums=('SKIP')
pkgver() {
	 cd "$srcdir/find-and-list-file-folder-recursively"
	git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/'
}

package() {
	cd "$srcdir/find-and-list-file-folder-recursively"
	cp List.sh README.md "$pkgdir/"
	cat List.sh >>~/.bashrc
}
