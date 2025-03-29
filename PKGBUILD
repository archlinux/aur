# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
pkgname=$_pkgname-bin
pkgver=35
pkgrel=1
pkgdesc='A cross-platform synthesizer patch editor library'
arch=(i686 x86_64)
url='https://github.com/eclab/edisyn/'
license=(Apache-2.0)
depends=('java-runtime>=20')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.jar::https://cs.gmu.edu/~eclab/projects/$_pkgname/$_pkgname.jar"
        "$_pkgname.desktop"
        "$_pkgname.sh")
noextract=("$_pkgname-$pkgver.jar")
sha256sums=('37361ec928be5cbb47dc1e197de733a3f74846c71dbbb76fd5d5463413d2689d'
            '6545bfc5fb5e41d1f6917c0c40145f8168c5d205a70ad1fb6810cf57c68fb618'
            '00b15c90b4c8d902567ec6544ae13d845851afd94b0e76822593774493a25b45')

package() {
  install -vDm 644 "$srcdir"/$_pkgname-$pkgver.jar \
    "$pkgdir"/usr/share/java/${_pkgname}/$_pkgname.jar
  install -vDm 755 "$srcdir"/$_pkgname.sh \
    "$pkgdir"/usr/bin/$_pkgname
  install -vDm 644 "$srcdir"/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
}
