# Maintainer: yuna0x0 <yuna@yuna0x0.com>
# Contributor: NovaDragon <me@novadeagon.space>

pkgname=godots-bin
pkgver=1.4.stable
pkgrel=1
pkgdesc="A hub for managing your Godot versions and projects."
arch=('x86_64')
url="https://github.com/MakovWait/godots"
license=('MIT')
provides=("godots=$pkgver-$pkgrel")
conflicts=('godots' 'godots-git')
options=('!strip')
depends=('unzip')
source=("$pkgname-$pkgver-LinuxX11.zip::https://github.com/MakovWait/godots/releases/download/v$pkgver/LinuxX11.zip"
        "$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/LICENSE"
        "$pkgname-$pkgver-icon.svg::https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/icon.svg"
        "$pkgname-$pkgver-io.github.MakovWait.Godots.desktop::https://raw.githubusercontent.com/MakovWait/godots/refs/tags/v$pkgver/packaging/linux/io.github.MakovWait.Godots.desktop")
sha256sums=('0d7e16c526c82f147f79bf4e4f94904abc49db41d244b9e4929b2d05aa6007c7'
            '76b8e9aacad7b9b2fd0c699065186191f8705d8f1892ee36873c56f904f073ef'
            'de088f3452e04986b4988b2a22a6518a4aaaab64e808ea9eee352bea141e774a'
            '7e47f6279d501a57a6fe1babf386ac8d4ae39ce6c22b3764569d060c54d88792')

package() {
    install -Dm755 "Godots.x86_64" "$pkgdir/usr/bin/godots"

    install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$pkgname-$pkgver-icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.svg"
    install -Dm644 "$pkgname-$pkgver-io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/io.github.MakovWait.Godots.desktop"
}
