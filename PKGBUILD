# Maintainer: AkitaOnRails <boss@akitaonrails.com>

pkgname=geary-email-autocomplete-bin
_pkgname=geary-email-autocomplete
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK3 module that widens Geary recipient autocomplete from its contact history (prebuilt binary)"
arch=('x86_64')
url="https://github.com/akitaonrails/geary-email-autocomplete"
license=('MIT')
depends=('geary' 'gtk3' 'glib2' 'sqlite')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
install="$_pkgname.install"
options=('!strip' '!debug')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums_x86_64=('2ee2b790786e31399853f60ab22ab26848af85af9123ff1a16689318bdd2d7ff')

package() {
    install -Dm0755 "libgeary-email-autocomplete.so" \
        "$pkgdir/usr/lib/$_pkgname/libgeary-email-autocomplete.so"
    install -Dm0755 "inject.sh" \
        "$pkgdir/usr/lib/$_pkgname/inject.sh"
    install -Dm0644 "geary-email-autocomplete.hook" \
        "$pkgdir/usr/share/libalpm/hooks/$_pkgname.hook"
    install -Dm0644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
