# Maintainer: Helltar <iam@helltar.com>

pkgname=plainotepad
pkgver=0.2.0
pkgrel=1
pkgdesc="Plain text editor with minimalistic design"
arch=('x86_64')
url="https://github.com/Helltar/plainotepad"
license=('GPL3')
depends=('qt5pas')

source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.svg")

sha256sums=('2a8fffa9b2d93d63c19fa44b4f9e4d0f873da5a46044b1808f1a5e52c4886b09'
            '214efdd29cc25800944e33720e593dbfa86b699ef44456e231af327fdf5e0583'
            '088d8e42a7246920b0e8d0fc5dc76f7907f2086c56abd93330386d1e2ca933cc')

package() {

    mkdir -p "$pkgdir"/usr/bin
    cp -r $pkgname "$pkgdir"/usr/bin/$pkgname

    install -Dm644 $pkgname.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
    install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
