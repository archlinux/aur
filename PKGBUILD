# Maintainer: Jacson Curtis <justjcurtis@gmail.com>
pkgname=flxvwr-bin
pkgver=0.0.6
pkgrel=1
pkgdesc="A simple, flexible, image viewer"
arch=('x86_64')
url="https://github.com/justjcurtis/flxvwr"
license=('MIT')  # https://github.com/justjcurtis/flxvwr/blob/main/LICENSE
depends=('glibc' 'libglvnd' 'libx11')
source=("flxvwr-x64-v$pkgver.tar.xz::$url/releases/download/v$pkgver/flxvwr-x64-v$pkgver.tar.xz" 
        "LICENSE::https://raw.githubusercontent.com/justjcurtis/flxvwr/main/LICENSE")
sha256sums=('0b15bee3ba22c7c007d9c39da8a6968872f7180e2f0ccb09cbebf154aeb95033' '40d1955119619603715da88c797f76b52e5e478392b953284b917e04285cf3ef')
provides=('flxvwr')
conflicts=('flxvwr' 'flxvwr-git')

package() {
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
