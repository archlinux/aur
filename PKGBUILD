# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=cmcl
pkgver=2.2.1
pkgrel=21
epoch=
pkgdesc="A Minecraft Java Edition Launcher Running on the Command Line"
arch=('any')
url="https://github.com/MrShieh-X/console-minecraft-launcher"
license=('GPL3')
groups=()
depends=('bash' 'java-runtime')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MrShieh-X/console-minecraft-launcher/releases/download/$pkgver/$pkgname")
noextract=("$pkgname")
sha256sums=("db0bc11131e8e02cb7d1e580944df96b3016198b630561b17b6e70bb4348243c")
validpgpkeys=()

prepare() {
    rm -rf $pkgname-$pkgver
    mkdir -p $pkgname-$pkgver
    mv cmcl $pkgname-$pkgver
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
