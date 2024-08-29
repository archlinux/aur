# Maintainer: LunarEclipse <luna@lunareclipse.zone>
# Contributor: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.12.0
pkgrel=1
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url='https://gitlab.com/veloren/airshipper'
license=('GPL3')
depends=('libxcb' 'gcc-libs')
optdepends=('vulkan-icd-loader: GUI support'
            'vulkan-driver: GUI support')
provides=()
conflicts=()
install="airshipper.install"
source=(
    "$pkgname-$pkgver"::"https://github.com/veloren/Airshipper/releases/download/v$pkgver/airshipper-linux-x86_64.tar.gz"
    'airshipper.desktop'
    'airshipper.install'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('f85cad6fd1f1262fd17363c518e20b0c02ef69e78a845c78fe9f084d5ae7c163a69afa6f0a58383209ef17c3bb1d9613ecd786589dc9c3c04a70e2d6c04a1afd'
            '4937c26f412c07946ccadacb5a6951e5f42af46b5e44e05a38a6628c09c2a1dbaf98ceec846f5487632a06f38fb8d7453928315ab952908b606716d7370ce606'
            'ce561587113480c8485892983eed16aca6979afa024cc8e7842fd349896696e3bee825ca0214cbdcc8fb972f432957a172df9adc7daa8bf2a7bc2b2828c09928'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
package() {
    install -D "$srcdir/airshipper-linux-x86_64/airshipper" -t "$pkgdir/usr/bin/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
