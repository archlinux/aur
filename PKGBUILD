# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=mpv-kscreen-doctor
pkgver=0.2.2
pkgrel=1
pkgdesc='A plugin for mpv to automatically switch the display refresh rate in a KDE session.'
arch=('any')
url='https://gitlab.com/smaniottonicola/mpv-kscreen-doctor'
license=('Unlicense')
depends=('libkscreen' 'mpv')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('44eccffdff239fe10bb06bd83e4e0e94151eefe2491030ce7bfb962066db0279')

package() {
    cd $pkgname-v$pkgver
    install -Dm644 $pkgname.lua -t "$pkgdir"/usr/share/mpv/scripts
    install -dm755 "$pkgdir"/etc/mpv/scripts
    ln -sf /usr/share/mpv/scripts/$pkgname.lua "$pkgdir"/etc/mpv/scripts/$pkgname.lua
}
