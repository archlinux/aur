# Maintainer: endlesseden
_pkgname=python-ffplaylist
pkgname=$_pkgname-git
pkgver=0.1.r4.g3f404ea
pkgrel=1
pkgdesc="A Python implementation of Hybrid Radio SPI"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gumblex/ffplaylist"
license=('WTFPL')
groups=()
depends=('python')
checkdepends=()
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 random_files.py -t "${pkgdir}/usr/bin/"
	install -Dm755 ffplaylist.py -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
