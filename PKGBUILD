# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
pkgname=$_pkgname-bin
pkgver=36
pkgrel=1
pkgdesc='A cross-platform synthesizer patch editor library'
arch=(i686 x86_64)
url='https://github.com/eclab/edisyn/'
license=(Apache-2.0)
depends=('java-runtime>=20')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname-$pkgver.jar::https://people.cs.gmu.edu/~eclab/projects/$_pkgname/$_pkgname.jar"
        "$_pkgname.desktop"
        "$_pkgname.sh")
noextract=("$_pkgname-$pkgver.jar")
sha256sums=('e3cfceb320bb3aee72601c0c828b4f23fcdadba0566145e5c0bc23ca037235c6'
            '6545bfc5fb5e41d1f6917c0c40145f8168c5d205a70ad1fb6810cf57c68fb618'
            'e8154776a330ab82a6daf48dd9f6f09e7a923ccfdd698a6645cbca1d2b1d7be1')

package() {
  install -vDm 644 "$srcdir"/$_pkgname-$pkgver.jar \
    "$pkgdir"/usr/share/java/${_pkgname}/$_pkgname.jar
  install -vDm 755 "$srcdir"/$_pkgname.sh \
    "$pkgdir"/usr/bin/$_pkgname
  install -vDm 644 "$srcdir"/$_pkgname.desktop \
    -t "$pkgdir"/usr/share/applications
}
