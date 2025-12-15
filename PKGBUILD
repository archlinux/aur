# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=cytrence-kiwi
pkgver=1.5.4
pkgrel=1
pkgdesc="Cytrence Kiwi - Native-like KVM Development Tool"
arch=('x86_64')
url="https://cytrence.com"
license=('custom')
depends=('glibc')
makedepends=('unzip')
install=cytrence-kiwi.install
options=('!strip')
source=("https://www.cytrence.com/_files/archives/5418d8_3808964163234e3897f16d6a63d488c8.zip?dn=CytrenceKiwi-1.5.4-ubuntu24_amd64.zip")
sha256sums=('66e3db7ed7b407dc4200a92a4b903b7ca09e7f905fdbe81779651ff89c18257c')

package() {
    # Extract the deb package from the zip
    cd "$srcdir"
    ar x "CytrenceKiwi_${pkgver}-ubuntu24_amd64.deb"
    tar -xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgdir/opt/cytrence/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
