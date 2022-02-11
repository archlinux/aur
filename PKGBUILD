pkgname=tabby-terminal
pkgver=1.0.171
pkgrel=1
pkgdesc="A terminal for a modern age"
arch=("x86_64")
url="https://github.com/Eugeny/tabby#readme"
license=("MIT")
provides=("tabby")
depends=(
    "gnome-keyring"
    "libsecret"
)
source=(
    "tabby-${pkgver}-linux.pacman::https://github.com/Eugeny/tabby/releases/download/v${pkgver}/tabby-${pkgver}-linux.pacman"
)
sha256sums=(
    "3f778dadc64ebe2a716002cf73bf87f8ce834b2c649a8202de1b3299c71f446c"
)

package() {
    cd ${srcdir}
    tar -xvf tabby-${pkgver}-linux.pacman -C ${pkgdir}
    # Remove exsiting files
    rm -f ${pkgdir}/.PKGINFO ${pkgdir}/.MTREE ${pkgdir}/.INSTALL
}
