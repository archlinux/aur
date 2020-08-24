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
sha512sums=('SKIP')

package() {
	rpm2cpio $pkgname-$pkgver-13.fc27.noarch.rpm | bsdtar -xf - -C "$pkgdir/"

	cp -r "$pkgdir"/usr/share/myspell/ "$pkgdir"/usr/share/hunspell
	mkdir "$pkgdir"/usr/share/myspell/dicts
	mv "$pkgdir"/usr/share/myspell/*.* "$pkgdir"/usr/share/myspell/dicts/
}
