# Maintainer: Sander Smid-Merlijn <sander..smid@gmail.com>
pkgname=stencyl
pkgver=4.0.1
pkgrel=1
pkgdesc='Create amazing games without code'
arch=(x86_64)
url=http://www.stencyl.com
license=(custom)
#depends=()
#makedepends=()
#conflicts=()
#provides=()
options=('!strip')
#install=
source=(stencyl
        stencyl.desktop
        stencyl.png
        LICENSE)
md5sums=('e97ff31637ae4f223062269bfce3f8ab'
         '97eccf2c15f9f40bac4aaebbfe06f976'
         'c99ae55db267e86c0936e01662ee12ea'
         '986e231db4a39dd7fa59c93a7e06b7c2')

archive="Stencyl-64-full.tar.gz"
source+=("$archive::http://www.stencyl.com/download/get/lin64/")
md5sums+=('3c1691239496ca02be97bb9fcd5266b5')
noextract=("$achive")

package() {
    # Uncompress the source into the final directory
    install -Ddm755 "$pkgdir"/usr/share/stencyl
    tar -xzf "$srcdir/$archive" -C "$pkgdir"/usr/share/stencyl/

    # Install the custom launch script, the .desktop and the icon
    install -Dm755 "$srcdir/stencyl" "$pkgdir/usr/bin/stencyl"
    install -Dm755 "$srcdir/stencyl.desktop" "$pkgdir/usr/share/applications/stencyl.desktop"
    install -Dm644 "$srcdir/stencyl.png" "$pkgdir/usr/share/pixmaps/stencyl.png"

    # Install the license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
