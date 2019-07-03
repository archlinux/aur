# Maintainer: leogx9r
pkgname=gtk-theme-windows10-dark-git
pkgver=19b5a90
pkgrel=1
pkgdesc="GTK 3.x Theme made to emulate a Windows 10 environment on Linux machines. Keeps upstream with master branch."
arch=('any')
license=('GPL')
depends=('gtk-engine-murrine')
themename=Windows-10-Dark
url="https://github.com/B00merang-Project/Windows-10-Dark"
source=("${themename}::git+https://github.com/B00merang-Project/Windows-10-Dark.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${themename}"
	git rev-parse --short HEAD
}

package() {
	rm -rf "${themename}/.git"

  	install -d -m 755 "$pkgdir/usr/share/themes/${themename}"

	cd "${themename}"
  	find . -type f -exec install -D -m 644 '{}' "$pkgdir/usr/share/themes/${themename}/{}" \;
}
