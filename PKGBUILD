# Maintainer: Mubashir Haroon <mubashirmusab at gmail dot com>

pkgname=hunspell-ur
pkgver=0.64
pkgrel=3
pkgdesc="Urdu hunspell dictionaries"
arch=('any')
url="http://www.codeplex.com/UrduDictionary"
license=('LGPLv2')
optdepends=(
	'hunspell: the spell checking libraries and apps'
)
makedepends=('rpmextract')
source=("https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/27/Workstation/x86_64/os/Packages/h/$pkgname-$pkgver-13.fc27.noarch.rpm")
sha512sums=('a873ef1c2edd04b31a0e312bc83b10ffb5617e854d98686c4b2887568124c8fa7e4479c322089483c5213e7b3621b521a1405cc65b51e7468c3b51a4c5127ce3')

package() {
	rpm2cpio $pkgname-$pkgver-13.fc27.noarch.rpm | bsdtar -xf - -C "$pkgdir/"

	cp -r "$pkgdir"/usr/share/myspell/ "$pkgdir"/usr/share/hunspell
	mkdir "$pkgdir"/usr/share/myspell/dicts
	mv "$pkgdir"/usr/share/myspell/*.* "$pkgdir"/usr/share/myspell/dicts/
}
