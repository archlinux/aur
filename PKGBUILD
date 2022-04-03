# Maintainer: Mckol <mckol363@gmail.com>
# Contributor: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.7.0
pkgrel=3
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://gitlab.com/veloren/airshipper'
license=('GPL3')
depends=('libxcb' 'gcc-libs')
optdepends=('vulkan-icd-loader: GUI support'
            'vulkan-driver: GUI support')
provides=()
conflicts=()
source=(
    "$pkgname"::"https://gitlab.com/veloren/airshipper/-/jobs/artifacts/v$pkgver/download?job=linux"
    'airshipper.desktop'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('14474c558b49ffd6810aac46bf58089c8b3c38a0289a80790ea1a8fb4bddb61d4055e949abe5e1d838e3eb8c72bb470d2a79b96c2b2c7e103050d378a356dc3a'
            '76b8d61db797730837852ee8b8526532e0bcec0ed4a9d43ae7f93ebb4ad22afd4ea55445638e598f581b32e05dcd04a1435a774fd36345760cad8084a72560de'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
package() {
    install -D "$srcdir/airshipper" -t "$pkgdir/usr/bin/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
