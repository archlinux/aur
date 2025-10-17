# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=cytrence-kiwi
pkgver=1.3.17
pkgrel=1
pkgdesc="Cytrence Kiwi - Native-like KVM Development Tool"
arch=('x86_64')
url="https://cytrence.com"
license=('custom')
depends=('glibc')
makedepends=('unzip')
install=cytrence-kiwi.install
options=('!strip')
source=("https://www.cytrence.com/_files/archives/5418d8_54cf9f023f2a42ef8d8c9cc9ca864d9c.zip?dn=CytrenceKiwi-1.3.17-ubuntu24_amd64.zip")
sha256sums=('9a5db43ac51257f6bc9b85dca577d46bb6bdce511fe2a24e31d2d87b5ad5b369')

package() {
    # Extract the deb package from the zip
    cd "$srcdir"
    ar x "CytrenceKiwi_${pkgver}-ubuntu24_amd64.deb"
    tar -xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgdir/opt/cytrence/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
