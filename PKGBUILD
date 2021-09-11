# Maintainer: Scott Shumate <scott@shumatech.com>
pkgname=libsciter-gtk-bin
pkgver=4.4.6.6
pkgrel=1
pkgdesc='Sciter SDK library for GTK3'
arch=(x86_64)
url='https://sciter.com'
license=(custom)
depends=(gtk3)
provides=(libsciter-gtk)
conflicts=(libsciter-gtk)
_commit=0b70a731ea91164cba1baa97874db1929ed8e5f0
source=('https://github.com/c-smile/sciter-sdk/raw/'$_commit'/bin.lnx/x64/libsciter-gtk.so'
        'https://github.com/c-smile/sciter-sdk/raw/'$_commit'/license.htm')
noextract=('libsciter-gtk' 'license.htm')
sha256sums=('921176f115ec2087fe0122fe6bc2a53687a0bde9e005171554a3159ce87f73ee'
            'a52733cc90fb112a730b67bbbe6fc1102fad644753af9bd584cab8ba0da3db49')

package() {
    install -m 0755 "$srcdir/libsciter-gtk.so" -D -t "$pkgdir/usr/lib"
    install -m 0644 "$srcdir/license.htm" -D -t "$pkgdir/usr/share/licenses/$pkgname"
}
