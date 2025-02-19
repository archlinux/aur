# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
pkgname='amdvbflash'
pkgver='4.104e'
pkgrel='1'
pkgdesc='AMD vBIOS flash utility'
arch=('x86_64')
url='https://www.techpowerup.com/forums/threads/amdvbflash-4-104e-for-64-bit-linux-with-updated-support-for-vbios-flash-on-big-navi2x-gpus.313927/post-5106820'
license=('unknown')
source=("$pkgname-$pkgver.zip::https://www.techpowerup.com/forums/attachments/amdvbflash4-104e-linux-zip.314661/")
sha512sums=('56eace73c377f9c57344618a168155a2af3a8895f343717a70decdd1fb4beb2a6c367f02e7a7f7e334e332d234df3cee61d022c65962fb3dcf061f382bdbbc2b')

_binaryname='amdvbflash4-104E'

check() {
	_checkoutput="$("$srcdir/$_binaryname" --version || :)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'Application requires administrative privileges.$'
}

package() {
	cd "$srcdir/"
	install -Dm755 "$_binaryname" "$pkgdir/usr/bin/$pkgname"
}
