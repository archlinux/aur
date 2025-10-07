# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=cytrence-kiwi
pkgver=1.3.14
pkgrel=1
pkgdesc="Cytrence Kiwi - Native-like KVM Development Tool"
arch=('x86_64')
url="https://cytrence.com"
license=('custom')
depends=('glibc')
makedepends=('unzip')
install=cytrence-kiwi.install
options=('!strip')
source=("https://www.cytrence.com/_files/archives/5418d8_c3e1ac49a6cf4509b4b3d0ed769e89b5.zip")
sha256sums=('4e2b78027d55164c811ff086b41e5d78dcdd1784a858516e1ffa00d8c503a762')

package() {
    # Extract the deb package from the zip
    cd "$srcdir"
    ar x "CytrenceKiwi_${pkgver}-ubuntu24_amd64.deb"
    tar -xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgdir/opt/cytrence/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
