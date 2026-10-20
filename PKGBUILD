# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=cytrence-kiwi
pkgver=1.6.2
pkgrel=1
pkgdesc="Cytrence Kiwi - Native-like KVM Development Tool"
arch=('x86_64')
url="https://cytrence.com"
license=('custom')
depends=('glibc')
makedepends=('unzip')
install=cytrence-kiwi.install
options=('!strip')
source=("https://www.cytrence.com/_files/archives/5418d8_eb4cf20e091246c39429596bbe5f03d9.zip?dn=CytrenceKiwi-1.6.2-ubuntu24_amd64.zip")
sha256sums=('8a7ed7e5993218843456c0af8dd9b17d3255cf682ff9e03582c5af537d9b0dca')

package() {
    # Extract the deb package from the zip
    cd "$srcdir"
    ar x "CytrenceKiwi_${pkgver}-ubuntu24_amd64.deb"
    tar -xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgdir/opt/cytrence/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
