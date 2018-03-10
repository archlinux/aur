# Maintainer: scan

pkgname=numix-cursor-maia-git
pkgver=r15.2cefdb1
pkgrel=1
pkgdesc='Maia Colored Numix Cursor theme'
arch=('any')
url='https://github.com/mustafaozhan/Numix-Cursor-Maia'
license=('LGPL')
makedepends=('git')
source=('numix-cursor-maia::git+https://github.com/mustafaozhan/Numix-Cursor-Maia.git')
sha256sums=('SKIP')

pkgver() {
  cd numix-cursor-maia

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
	install -d $pkgdir/usr/share/icons
	cp -r numix-cursor-maia $pkgdir/usr/share/icons/numix-cursor-maia
	find ${pkgdir} -type f -exec chmod 644 {} \;
	find ${pkgdir} -type d -exec chmod 755 {} \;
}

