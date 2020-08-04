pkgname=list-git
pkgver=0.0.1.r0.g8b1fe31
pkgrel=1
pkgdesc="Utility wrapper in bash function script to search files, and show info, dependencies etc, it'd be put in .bashrc"
arch=('any')
url="https://github.com/abdulbadii/find-and-list-file-folder-recursively"
license=('GPL3')
depends=('bash' 'findutils' 'sed' 'file' 'glibc' )
optdepends=('pcre2')
makedepends=('git')
provides=("list")
source=('git+https://github.com/abdulbadii/find-and-list-file-folder-recursively.git')
md5sums=('SKIP')
pkgver() {
	 cd "$srcdir/find-and-list-file-folder-recursively"
	git describe --long --tags | sed -E 's/^v//;s/-(\w+)-g/.r\1.g/'
}

package() {
	cd "$srcdir/find-and-list-file-folder-recursively"
	cp List.sh README.md "$pkgdir/"
	cat  README.md
	cat List.sh >>~/.bashrc
}
