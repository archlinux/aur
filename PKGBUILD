# Maintainer: jacopotediosi <jacopotediosi at gmail dot com>

pkgname=mswinurl-handler
pkgver=1.0
pkgrel=1

pkgdesc="Opens .url shortcut files in the default browser"
arch=('any')
license=('MIT')

depends=('xdg-utils')

source=('mswinurl-handler.sh'
        'mswinurl-handler.desktop'
        'mswinurl.xml')

sha256sums=('16665ebe896c7fd0306407ac00dadc8a61a17863ca3fd5c0420452346d2dc908'
            '08794bcf82640b06e1c652d574b6fe76fcfff75b71b5dc944ce34bfb407ab93b'
            'bc0141fb561a3204cb5b65dafc0e2cc15b308b91def876f2b9aea8dfdbf489e7')

package() {
    install -Dm755 "$srcdir/mswinurl-handler.sh" "$pkgdir/usr/bin/mswinurl-handler"
    install -Dm644 "$srcdir/mswinurl-handler.desktop" "$pkgdir/usr/share/applications/mswinurl-handler.desktop"
    install -Dm644 "$srcdir/mswinurl.xml" "$pkgdir/usr/share/mime/packages/mswinurl.xml"
}

post_install() {
    update-mime-database /usr/share/mime
    update-desktop-database -q
}

post_remove() {
    update-mime-database /usr/share/mime
    update-desktop-database -q
}
