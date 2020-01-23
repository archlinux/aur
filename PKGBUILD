# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Hokuto <abrahamhokuto@outlook.com>

pkgname=windows-xp-icons-git
pkgver=3.1.r0.g1d69213
pkgrel=1
epoch=1
pkgdesc="Remake of classic YlmfOS theme with some mods for icons to scale right"
arch=('any')
url="https://github.com/B00merang-Project/WinXP-Icons"
license=('GPL')
makedepends=('git')
source=('git+https://github.com/B00merang-Project/WinXP-Icons.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/WinXP-Icons"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/WinXP-Icons"

  install -d -m755 "$pkgdir/usr/share/icons/WinXP"

  find . -type f -exec \
       install -D -m644 '{}' "$pkgdir/usr/share/icons/WinXP/{}" \;

  find . -type l -exec \
       install -D -m644 '{}' "$pkgdir/usr/share/icons/WinXP/{}" \;
}
