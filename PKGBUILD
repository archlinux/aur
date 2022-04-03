# Maintainer: Mckol <mckol363@gmail.com>
# Contributor: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.7.0
pkgrel=2
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
sha512sums=('2b42bc52535aa91a7c1f33e118c6e00c62f2317e7cafd44ad72d541bffad78c9fbe0471aca3673aba506c6e37832a569c7ea832da8d330de820a9782c01e1cf3'
            '76b8d61db797730837852ee8b8526532e0bcec0ed4a9d43ae7f93ebb4ad22afd4ea55445638e598f581b32e05dcd04a1435a774fd36345760cad8084a72560de'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
package() {
    install -D "$srcdir/airshipper" -t "$pkgdir/usr/bin/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
