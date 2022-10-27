# Maintainer: Helltar <iam@helltar.com>

pkgname=plainotepad
pkgver=0.1.0
pkgrel=1
pkgdesc="Plain text editor with minimalistic design"
arch=('x86_64')
url="https://github.com/Helltar/plainotepad"
license=('GPL3')
depends=('qt5pas')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.svg")

sha256sums=('3580320d003d72c799b60721749cf32fa592e02e402f58fa39da0f6f5bd8cabd'
            '214efdd29cc25800944e33720e593dbfa86b699ef44456e231af327fdf5e0583'
            '088d8e42a7246920b0e8d0fc5dc76f7907f2086c56abd93330386d1e2ca933cc')

package() {

    mkdir -p "$pkgdir"/usr/bin
    cp -r $pkgname "$pkgdir"/usr/bin/$pkgname

    install -Dm644 $pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
