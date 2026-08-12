# Maintainer: yuna0x0 <yuna@yuna0x0.com>
# Contributor: NovaDragon <me@novadeagon.space>

pkgname=godots-bin
pkgver=1.4.2.stable
pkgrel=2
pkgdesc="A hub for managing your Godot versions and projects."
arch=('x86_64')
url="https://github.com/MakovWait/godots"
license=('MIT')
provides=("godots=$pkgver-$pkgrel")
conflicts=('godots')
options=('!strip')
depends=('unzip')
source=("$pkgname-$pkgver-LinuxX11.zip::https://github.com/MakovWait/godots/releases/download/v$pkgver/LinuxX11.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/LICENSE"
        "$pkgname-$pkgver-icon.svg::https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/icon.svg"
        "$pkgname-$pkgver-io.github.MakovWait.Godots.desktop::https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/packaging/linux/io.github.MakovWait.Godots.desktop")
sha256sums=('8f2d2e06ecc543f5087c93330e3d15a2fe701c7d72d37a028705c830e6ebe70e'
            '76b8e9aacad7b9b2fd0c699065186191f8705d8f1892ee36873c56f904f073ef'
            'de088f3452e04986b4988b2a22a6518a4aaaab64e808ea9eee352bea141e774a'
            '7e47f6279d501a57a6fe1babf386ac8d4ae39ce6c22b3764569d060c54d88792')

package() {
    install -Dm755 "Godots.x86_64" "$pkgdir/usr/bin/godots"

    install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$pkgname-$pkgver-icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.svg"
    install -Dm644 "$pkgname-$pkgver-io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/io.github.MakovWait.Godots.desktop"
}
