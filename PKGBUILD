# Maintainer: Helltar <iam@helltar.com>

pkgname=idevicegui
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple GUI for libimobiledevice"
arch=('x86_64')
url="https://github.com/Helltar/idevicegui"
license=('GPL3')
depends=('ifuse' 'qt5pas')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.128.png"
        "$pkgname.512.png")

sha256sums=('7167b90a4434dd2fefbb531feaef5a4f49ec9f8b9a51c1079f6011a7eff44fd5'
            'fe9323c3927bbaf6eeb543c3063fabf054ead5011f97d9a3a10d0f247ab49762'
            '15cf328787e4a6a0bf86c87cfa017023bac67fc0bfd6d02942d0ac674c2d00ec'
            '4cb880cb022f45ffc5b93a6cf30077783aa2e7e55902770bcb586285eef8e44d')

package() {

    mkdir -p "$pkgdir"/usr/bin
    cp -r $pkgname "$pkgdir"/usr/bin/$pkgname
    
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    
    install -Dm644 $pkgname.128.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/$pkgname.png
    install -Dm644 $pkgname.512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
}
