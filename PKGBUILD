# Maintainer: Scott Shumate <scott@shumatech.com>
pkgname=libsciter-gtk-bin
pkgver=4.4.3.25
pkgrel=1
pkgdesc='Sciter SDK library for GTK3'
arch=(x86_64)
url='https://sciter.com'
license=(custom)
depends=(gtk3)
provides=(libsciter-gtk)
conflicts=(libsciter-gtk)
_commit=0448b4ece2e582fea6b5ad185456e852bb3dee48
source=('https://github.com/c-smile/sciter-sdk/raw/'$_commit'/bin.lnx/x64/libsciter-gtk.so'
        'https://github.com/c-smile/sciter-sdk/raw/'$_commit'/license.htm')
noextract=('libsciter-gtk' 'license.htm')
sha256sums=('241e1144756f284fd71467b4ea1b05c99265aa103924d69a3feed3c61b965dd4'
            'a52733cc90fb112a730b67bbbe6fc1102fad644753af9bd584cab8ba0da3db49')

package() {
    install -m 0755 "$srcdir/libsciter-gtk.so" -D -t "$pkgdir/usr/lib"
    install -m 0644 "$srcdir/license.htm" -D -t "$pkgdir/usr/share/licenses/$pkgname"
}
