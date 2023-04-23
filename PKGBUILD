# Maintainer: a13xie <rostik.medved@gmail.com>
pkgname=('libproidplus-gui')
pkgver=2.4.2
pkgrel=2
_filename="libproidplus-gui_${pkgver}-0_amd64"
pkgdesc="Library for ProID+ SmartCards"
arch=('x86_64')
url="https://proid.cz/"
license=('custom:EULA')
source=("local://${_filename}.deb.zip")
sha256sums=('68b7bb2ad4e28e770e6795a2e4e8a2f47fc4463f619d356cb6018a97ff7f3aad')

package () {
	mkdir "$srcdir/$pkgname"
	bsdtar -C "$srcdir/$pkgname" -xf "$srcdir/${_filename}.deb"
	bsdtar -C "$pkgdir" -xf "$srcdir/$pkgname/data.tar.xz"
	mv "$pkgdir/usr/lib/x86_64-linux-gnu/pkcs11" "$pkgdir/usr/lib/pkcs11"
}
