# Maintainer: parazyd <parazyd AT dyne DOT org>
pkgname=gtomb-git
pkgver=0.7.1
pkgrel=1
pkgdesc="GUI wrapper for Tomb, the crypto undertaker"
arch=('any')
url="https://github.com/parazyd/gtomb"
license=('GPL3')
depends=('zsh' 'zenity' 'tomb' 'tomb-kdf' 'tomb-git' 'tomb-kdf-git')
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
    printf "\n\n***********************************************\n\n"
}
