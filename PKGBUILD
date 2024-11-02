# Maintainer: Helltar <iam@helltar.com>

pkgname=plainotepad
pkgver=0.9.14
pkgrel=1
pkgdesc="Plain text editor with minimalistic design"
arch=('x86_64')
url="https://github.com/Helltar/plainotepad"
license=('GPL3')
depends=('qt5pas')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.256.png"
        "$pkgname.512.png"
        "$pkgname.svg")

sha256sums=('a707549ee725af36e77f07537910bb6c9e0f60b63593ae127c4998ea99f367e3'
            'c928a899615f36c4f42c225418b748a172598bcfeab02261075250cbae64c64a'
            '7fc0d607ff1308c463390b9b1a98d679bb72ea565b706b8523709c0c42bf1034'
            '085281144a79ec2526d96f1bd9a5841bb0d472f9e7f8f3ccd240bac73aee203e'
            '088d8e42a7246920b0e8d0fc5dc76f7907f2086c56abd93330386d1e2ca933cc')

package() {

    mkdir -p "$pkgdir"/usr/bin
    cp -r $pkgname "$pkgdir"/usr/bin/$pkgname
    
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    
    install -Dm644 $pkgname.256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
    install -Dm644 $pkgname.512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
    install -Dm644 $pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
}
