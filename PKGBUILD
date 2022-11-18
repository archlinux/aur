# Maintainer: Raspberry1111 <raspberry1111@duck.com>

pkgname=bottom-nightly-bin
pkgver=2022_11_17
pkgrel=1
pkgdesc="Yet another cross-platform graphical process/system monitor"
arch=(i686 x86_64)
url="https://github.com/ClementTsang/bottom"
license=('MIT')
provides=('bottom')
conflicts=('bottom' 'bottom-bin' 'bottom-git')
source=("bottom-$pkgver.tar.gz::https://github.com/ClementTsang/bottom/releases/download/nightly/bottom_$CARCH-unknown-linux-gnu.tar.gz")
sha256sums=(
        'SKIP'
)

pkgver() {
        _DATE=$(curl https://api.github.com/repos/ClementTsang/bottom/releases/tags/nightly -s | awk -F '"' '/"'"published_at"'":/{print $4}')
        date --date="$_DATE" +%Y_%m_%d
}

check() {
        ./btm --version
}

package() {
        install -D btm "$pkgdir/usr/bin/btm"
}
