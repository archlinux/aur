# Maintainer: Helltar <iam@helltar.com>

pkgname=gcencryptor
pkgver=1.5.6
pkgrel=1
pkgdesc="GUI application for gocryptfs"
arch=('x86_64')
url="https://github.com/Helltar/gcencryptor"
license=('GPL3')
depends=('qt5pas' 'gocryptfs')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.256.png"
        "$pkgname.512.png"
        "$pkgname.svg")

sha256sums=('121f1dd5127e3381a50087bdeb0f61f44af11e6da5e8e14709519b8b9ed52cd0'
            'c4bfd536f2ddfd146eacaec07589bac2a2d1e6762d547ee6cfad411f0fe42c46'
            'a80d78d4a27430de2ed983eb283b16bdd519cb25a74a19447c921c326d22e8a1'
            'e51a826d7251c0014a4ee208060aea92968367d40167c2d0d8f0cef4475af728'
            '64b0bce6f048d72e91621edb5403c7d132956b85b97790b55dd9ded646fc7467')

package() {

    mkdir -p "$pkgdir"/usr/lib
    cp -r $pkgname "$pkgdir"/usr/lib/$pkgname

    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/lib/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
    
    install -Dm644 $pkgname.256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
    install -Dm644 $pkgname.512.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
    install -Dm644 $pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
}
