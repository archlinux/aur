# Maintainer: SanskritFritz (gmail)
# Contributor: Sander Smid-Merlijn <sander..smid@gmail.com>
pkgname=stencyl
pkgver=4.0.4
pkgrel=2
pkgdesc='Create amazing games without code.'
arch=('x86_64')
url='http://www.stencyl.com'
license=(custom)
options=('!strip')
source=("https://static.stencyl.com/downloads/stencyl/release/$pkgver/Stencyl-$pkgver-linux.tar.gz"
        "stencyl"
        "stencyl.desktop"
        "stencyl.png"
        "LICENSE")
md5sums=('4cffaf180e5038c3c211859b31c295e3'
         'e97ff31637ae4f223062269bfce3f8ab'
         '6b52a9ecce3bddda2e77b3884503b888'
         'c99ae55db267e86c0936e01662ee12ea'
         '986e231db4a39dd7fa59c93a7e06b7c2')

package() {
    install -Ddm755 "$pkgdir"/usr/share
    cp -r "Stencyl-$pkgver-linux" "$pkgdir"/usr/share/stencyl

    # Install the custom launch script, the .desktop and the icon
    install -Dm755 "$srcdir/stencyl" "$pkgdir/usr/bin/stencyl"
    install -Dm755 "$srcdir/stencyl.desktop" "$pkgdir/usr/share/applications/stencyl.desktop"
    install -Dm644 "$srcdir/stencyl.png" "$pkgdir/usr/share/pixmaps/stencyl.png"

    # Install the license
    install -Dm644 "$srcdir/LICENSE" "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
