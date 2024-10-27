# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
pkgname=$_pkgname-bin
pkgver=34
pkgrel=1
pkgdesc='A cross-platform synthesizer patch editor library'
arch=(i686 x86_64)
url='https://github.com/eclab/edisyn/'
license=(Apache-2.0)
depends=('java-runtime>=11')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.jar::https://cs.gmu.edu/~eclab/projects/$_pkgname/$_pkgname.jar"
        "$_pkgname.desktop"
        "$_pkgname.sh")
noextract=("$_pkgname-$pkgver.jar")
sha256sums=('f6f44f4e0de39ace25cfc46891f378d7d715a1ff1387632a39369bb20ade71b6'
            '6545bfc5fb5e41d1f6917c0c40145f8168c5d205a70ad1fb6810cf57c68fb618'
            'a198edd3de2ad4a8edc344d90fb9e999fe02ea67b7f475bfce66a97f1723c9a7')

package() {
  install -vDm 644 "$srcdir"/$_pkgname-$pkgver.jar \
    "$pkgdir"/usr/share/java/${_pkgname}/$_pkgname.jar
  install -vDm 755 "$srcdir"/$_pkgname.sh \
    "$pkgdir"/usr/bin/$_pkgname
  install -vDm 644 "$srcdir"/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
}
