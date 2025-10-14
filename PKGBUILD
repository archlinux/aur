# Maintainer: LunarEclipse <luna@lunareclipse.zone>
# Contributor: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.16.0
pkgrel=2
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url='https://gitlab.com/veloren/airshipper'
license=('GPL3')
depends=('libxcb' 'gcc-libs')
optdepends=(
	'vulkan-icd-loader: GUI support'
    'vulkan-driver: GUI support'
    'pulseaudio-alsa: audio support on pulseaudio'
    'pipewire-alsa: audio support on pipewire'
)
provides=()
conflicts=()
install="airshipper.install"
source=(
    "$pkgname-$pkgver"::"https://gitlab.com/veloren/airshipper/-/jobs/artifacts/v$pkgver/download?job=linux-x86_64"
    'airshipper.desktop'
    'airshipper.install'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('45ea4848d0de9d75a08e7375e7dc1b439fd3f1090c9d782c0092fea3b51b158b30cb2880d6f23af7a84b7830cb0a6184e866de6c23e8ec0f7f5b3923e766dd3d'
            '4937c26f412c07946ccadacb5a6951e5f42af46b5e44e05a38a6628c09c2a1dbaf98ceec846f5487632a06f38fb8d7453928315ab952908b606716d7370ce606'
            'ce561587113480c8485892983eed16aca6979afa024cc8e7842fd349896696e3bee825ca0214cbdcc8fb972f432957a172df9adc7daa8bf2a7bc2b2828c09928'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
package() {
    install -D "$srcdir/airshipper" -t "$pkgdir/usr/bin/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
