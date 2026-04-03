# Maintainer: Lucas Oskorep <lucas.oskorep@gmail.com>
pkgname=cytrence-kiwi
pkgver=1.5.14
pkgrel=1
pkgdesc="Cytrence Kiwi - Native-like KVM Development Tool"
arch=('x86_64')
url="https://cytrence.com"
license=('custom')
depends=('glibc')
makedepends=('unzip')
install=cytrence-kiwi.install
options=('!strip')
source=("https://www.cytrence.com/_files/archives/5418d8_dfd7984f4e664b8fa25820e5dff5cf6a.zip?dn=CytrenceKiwi-1.5.14-ubuntu24_amd64.zip")
sha256sums=('73b8a59c1e48b34f992f13ae1e3c928f1247a5b19dcbeeaa15992819e018b32d')

package() {
    # Extract the deb package from the zip
    cd "$srcdir"
    ar x "CytrenceKiwi_${pkgver}-ubuntu24_amd64.deb"
    tar -xzf data.tar.gz -C "$pkgdir"

    # Install license
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$pkgdir/opt/cytrence/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA"
}
