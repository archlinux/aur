# Maintainer: Helltar <iam@helltar.com>

pkgname=plainotepad
pkgver=0.9.1
pkgrel=1
pkgdesc="Plain text editor with minimalistic design"
arch=('x86_64')
url="https://github.com/Helltar/plainotepad"
license=('GPL3')
depends=('qt5pas')

source=("$pkgname-$pkgver.tar.xz::$url/releases/download/$pkgver/$pkgname-$pkgver-linux.tar.xz"
        "$pkgname.desktop"
        "$pkgname.svg")

sha256sums=('b6438052172e11af50cbe668986c06c6d3235ea5361b8157a57201943fa28383'
            '214efdd29cc25800944e33720e593dbfa86b699ef44456e231af327fdf5e0583'
            '088d8e42a7246920b0e8d0fc5dc76f7907f2086c56abd93330386d1e2ca933cc')

package() {

    mkdir -p "$pkgdir"/usr/bin
    cp -r $pkgname "$pkgdir"/usr/bin/$pkgname

    install -Dm644 $pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
