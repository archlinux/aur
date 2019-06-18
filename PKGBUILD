# Maintainer: Eric Brandwein <brandweineric at gmail dot com>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
pkgname=clonehero
pkgver=0.22.5
pkgrel=1
pkgdesc="Clone of Guitar Hero and Rockband-style games"
arch=('x86_64')
url="https://clonehero.net/"
license=('freeware-proprietary')
install="$pkgname.install"
depends=('gtk2')
source=("http://dl.clonehero.net/clonehero-v.22.5/clonehero-linux.tar.gz"
        "$pkgname.install"
        "$pkgname.sh"
        "$pkgname.desktop")
sha1sums=('da4dc6c1a9d850432c0fddc79ef1f93bc659b7e3'
          'SKIP'
          'SKIP'
          'SKIP')
sha256sums=('SKIP'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            'a985b5761bcc287c627184ea8947b50adf4e208d77e4bb65d15d3d604566c403'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe')

package() {
    install -dm755 "$pkgdir/opt/"
    cp -r "$srcdir/$pkgname-linux" "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/clonehero"

    # Install script, .desktop launcher with icon
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-linux/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
    install -Dm644 "$srcdir/$pkgname-linux/clonehero_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

