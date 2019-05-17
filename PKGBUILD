pkgname=gtk-mcmojave-circle-icons-git
pkgver=520e55a
pkgrel=1
pkgdesc="MacOSX Mojave like circle icon theme for Linux desktops"
arch=('any')
license=('GPL')
depends=('gtk-engines')
optdepends=('gtk-engine-murrine')
themename=McMojave-circle
url=https://github.com/vinceliuice/McMojave-circle
source=("${themename}::git+https://github.com/vinceliuice/McMojave-circle.git#branch=master")
sha1sums=('SKIP')

pkgver() {
	cd "${themename}"
	git rev-parse --short HEAD
}

package() {
	cd "${themename}"
	rm -rf ".git"

  	install -d -m 755 "$pkgdir/usr/share/icons/${themename}"
  	install -d -m 755 "$pkgdir/usr/share/icons/${themename}-dark"

	cd "${themename}"
	find "." -type f -exec install -D -m 644 '{}' "$pkgdir/usr/share/icons/${themename}/{}" \;

	cd "../${themename}-dark"
  	find "." -type f -exec install -D -m 644 '{}' "$pkgdir/usr/share/icons/${themename}-dark/{}" \;
}
