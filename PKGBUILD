# Maintainer: Jacson Curtis <justjcurtis@gmail.com>
pkgname=flxvwr-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A simple, flexible, image viewer"
arch=('x86_64')
url="https://github.com/justjcurtis/flxvwr"
license=('MIT')  # https://github.com/justjcurtis/flxvwr/blob/main/LICENSE
depends=('glibc' 'libglvnd' 'libx11')
source=("flxvwr-x64-v$pkgver.tar.xz::$url/releases/download/v$pkgver/flxvwr-x64-v$pkgver.tar.xz" 
        "LICENSE::https://raw.githubusercontent.com/justjcurtis/flxvwr/main/LICENSE")
sha256sums=('415fbab98dfb03a5d5555837fa070619d2960d2e70ebb73dba8240bc4c0533b6' '40d1955119619603715da88c797f76b52e5e478392b953284b917e04285cf3ef')
provides=('flxvwr')
conflicts=('flxvwr' 'flxvwr-git')

package() {
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
