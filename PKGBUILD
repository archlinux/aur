# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='passman-git'
_pkgname='PyPassMan'
pkgver=1.0.0
pkgrel=1
pkgdesc="Secure, simple-to-use, lightweight command line password manager."
arch=('any')
url="https://github.com/binex-dsk/PyPassMan"
license=('GPL3')
source=("git+https://github.com/binex-dsk/PyPassMan.git"
	"passman.sh")
makedepends=('git')
depends=('python3' 'python-cryptography')
md5sums=('SKIP'
         'b95d2bbfde09a1619c0615eb91598d8b')

package() {
	mkdir -p "$pkgdir/usr/lib/passman"
	cd $srcdir/$_pkgname
	find -type f -name "*.py" -exec install -Dm755 "{}" "$pkgdir/usr/lib/passman/" \;
	cd ..
	install -Dm755 passman.sh "$pkgdir/usr/bin/passman"
}
