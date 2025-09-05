# Maintainer: villamorrd <villamorrd@students.nu-moa.edu.ph>
pkgname=pacup-git
pkgver=3.3.13
pkgrel=1
pkgdesc="Help maintainers update pacscripts"
arch=('any')
url="https://github.com/pacstall/pacup"
license=('GPL-3.0-or-later')
depends=(
	'perl'
	'perl-data-compare'
	'perl-file-chdir'
	'perl-ipc-system-simple'
	'perl-json'
	'perl-libwww'
	'perl-list-moreutils'
	'perl-term-progressbar'
	'perl-lwp-protocol-https'
)
makedepends=('git')
conflicts=('pacup')
source=("git+https://github.com/pacstall/pacup.git")
sha256sums=('SKIP')

build() {
	cd pacup
	perl Makefile.PL
	make
}

package() {
	cd pacup
	make DESTDIR="$pkgdir/" install
}
