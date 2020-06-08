# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=dinosaur
pkgver=1.2.0
pkgrel=1
pkgdesc="MS1 feature detection tool"
arch=('any')
url="https://github.com/fickludd/dinosaur"
license=('Apache')
depends=('java-environment')
_jarfile="Dinosaur-$pkgver.free.jar"
source=("https://github.com/fickludd/dinosaur/releases/download/$pkgver/${_jarfile}"
        "dinosaur")
sha256sums=('6e455136b75def47db1087bd2f0191f71bc6de38e2f936067a07c7033ec01629'
            '73284b175edfbfeb845a05da8e7c66a22e35d4c57a605f19daa7342938f09249')
noextract=("${_jarfile}")

package() {
    cd "$srcdir"
    install -D "${_jarfile}" "${pkgdir}/usr/share/java/${pkgname}/Dinosaur.jar"
    install -D dinosaur "${pkgdir}/usr/bin/dinosaur"
}
