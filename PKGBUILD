# Maintainer: PCITechie <pcitechie@member.fsf.org>
pkgname=packageprovides
pkgver=0.1
pkgrel=1
pkgdesc="Metapackage creator for Arch and Arch-based GNU/Linux distributions. Used to specify that a package provides anothers functionality, in case that is not specified in the repos or AUR."
arch=('any')
url="https://git.sr.ht/~pcitechie/PackageProvides"
license=('GPL')
makedepends=('gcc' 'git')
optdepends=('paru: AUR dependency resolving')
source=(https://git.sr.ht/~pcitechie/PackageProvides/archive/$pkgver.tar.gz)
md5sums=('4b1ce98651284e9c7676a7943189eeaa')

build() {
	cd "$srcdir/PackageProvides-$pkgver"
	gcc PackageProvides.c -o packageprovides
}

package() {
	cd "$srcdir/PackageProvides-$pkgver"
	mkdir -p "$pkgdir/etc/PackageProvides"
	mkdir -p "$pkgdir/usr/bin"
	cp -r README.md "$pkgdir/etc/PackageProvides/README.md"
	cp -r COPYING "$pkgdir/etc/PackageProvides/COPYING"
	cp -r PKGBUILDTEMPLATE "$pkgdir/etc/PackageProvides/PKGBUILDTEMPLATE"
	cp -r packageprovides "$pkgdir/usr/bin/packageprovides"
}
