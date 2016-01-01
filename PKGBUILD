# Maintainer: parazyd <parazyd@dyne.org>
pkgname=gtomb-git
pkgver=0.7.1
pkgrel=2
pkgdesc="GUI wrapper for Tomb, the crypto undertaker"
arch=('any')
url="https://github.com/parazyd/gtomb"
license=('GPL3')
depends=('zenity' 'tomb' 'tomb-kdf' 'tomb-git' 'tomb-kdf-git')
makedepends=('git')
source=('git://github.com/parazyd/gtomb')
sha1sums=('SKIP')

pkgver() {
    cd gtomb
    echo "$(git describe --long --tags | tr - .)"
}

package() {
    cd gtomb
    install -D -m 755 gtomb $pkgdir/usr/bin/gtomb

    printf "\n\n*******************IMPORTANT*******************\n\n"
    printf "Edit /usr/bin/gtomb if your tomb executable\n path is different from /usr/bin/tomb"
    printf "If you installed tomb from the AUR, you should be okay."
    printf "\n\n***********************************************\n\n"
}
