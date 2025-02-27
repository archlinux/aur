pkgname=sbell
pkgver=1.0.0
pkgrel=1
pkgdesc="An minimalist interpreter"
arch=('x86_64')
license=('GPL')
depends=('git')
source=("git+https://github.com/DameChocolateYa/sbell.git#branch=main")
md5sums=('SKIP')

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -Dm755 sbell "$pkgdir/usr/bin/sbell"

    touch ${HOME}/.sbellrc
    touch ${HOME}/.sbell_hist

    mkdir -p "$pkgdir/etc/sbell/lang/"

    install -Dm755 lang/* "$pkgdir/etc/sbell/lang/"
}
