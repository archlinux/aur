# Maintainer: Dmitry Kozlyuk <dmitry.kozliuk@gmail.com>
pkgname=sciter-notes-bin
pkgver='4.3.0.9'
pkgrel=1
pkgdesc='Evernote-like app based on Sciter SDK'
arch=(x86_64)
url='https://notes.sciter.com'
license=(custom)
depends=(gtk3)
source=('https://notes.sciter.com/distributions/sciter-notes.tar.gz'
        'https://raw.githubusercontent.com/c-smile/sciter-sdk/master/license.htm')
noextract=('license.htm')
md5sums=('3df3d7feaa1b26fcddd8e4fc66a70e08'
         'ee2065beedad9ac9a8bd53d63c8922a7')

package() {
    install -m 0755 "$srcdir/libsciter-gtk.so" -D -t "$pkgdir/usr/lib"
    install -m 0755 "$srcdir/notes" -D "$pkgdir/usr/bin/sciter-notes"
    install -m 0644 "$srcdir/license.htm" -D -t "$pkgdir/usr/share/licenses/$pkgname"
}
