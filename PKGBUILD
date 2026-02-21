# Maintainer: metaphy <metaphyman [at] proton [dot] me>
pkgname=mkinitcpio-contactinfo
pkgver=0.0.1
pkgrel=1
epoch=
pkgdesc="initcpio hook to show contact information before encrypt your disk"
arch=("any")
license=('unknown')
groups=()
depends=("mkinitcpio")
source=(example_message contactinfo_install contactinfo_hook)
noextract=()
sha256sums=('78487248ebbf2d04c9e744ba8818c0e2beb0c9d0074d571ca8c2bfc4a31ce86b' '97255373c81843640ddbfe9d081887b0e9b1300456bca70b5dfd6f4fc137a3c4' '4febe98499d31b066388030566f33b75cbb919dcbf89f7621aee4be719a40edb')
validpgpkeys=()
install=proto.install

package() {
	install -Dm0600 example_message "$pkgdir/etc/contactinfo.example"
	install -Dm0744 contactinfo_hook "$pkgdir/usr/lib/initcpio/hooks/contactinfo"
	install -Dm0744 contactinfo_install "$pkgdir/usr/lib/initcpio/install/contactinfo"
}
