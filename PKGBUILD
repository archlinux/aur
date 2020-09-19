# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='passman-git'
_pkgname='PyPassMan'
pkgver=1.0.0
pkgrel=1
pkgdesc="Super-secure, easy-to-use password manager."
arch=('any')
url="https://github.com/binex-dsk/PyPassMan"
license=('GPL3')
source=("git+https://github.com/binex-dsk/PyPassMan.git"
	"passman.sh")
makedepends=('git')
depends=('python3' 'python-cryptography')
md5sums=('SKIP'
         '8bb57da0fa0dcee2823bda7f1fbc132b')

package() {
	mkdir -pm755 "$pkgdir/usr/lib/passman"
	cd $srcdir/$_pkgname
	find -type f -name "*.py" -exec install -Dm755 "{}" "$pkgdir/usr/lib/passman/" \;
	cd ..
	install -Dm755 passman.sh "$pkgdir/usr/bin/passman"
}
