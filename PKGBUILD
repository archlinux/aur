# Maintainer: Balaraz <balaraz@tuta.io>

pkgname=sizeof-pypy
pkgver=0.37
pkgrel=2
pkgdesc="Find the size of files and Directory"
arch=('any')
url="https://github.com/ASHWIN990/sizeof"
license=('GPL3')
depends=('pypy3')
makedepends=('sed')
conflicts=('sizeof')
provides=('sizeof')
source=("https://sourceforge.net/projects/posix-sizeof/files/sizeof-${pkgver}.tar.gz")

md5sums=('692b151888e4253c26beccc04857c378')
sha256sums=('a226227d5aded2499032841b1dab653b3dbacca5f09e37f4ccbf630bfd06f9de')

package() {
	cd "$srcdir/sizeof-${pkgver}"
	sed -i 's/\/usr\/bin\/python3/\/usr\/bin\/pypy3/' ./sizeof
	install -Dm775 sizeof -t ${pkgdir}/usr/bin/
	install -Dm644 ${PWD}/.man/sizeof.1.gz -t ${pkgdir}/usr/share/man/man1/

}
