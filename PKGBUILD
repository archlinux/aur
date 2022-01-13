# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nikolay Chechulin <nchechulin@protonmail.com>>
pkgname=tim-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="ToDo improved - CLI todo application"
arch=("x86_64")
url="https://github.com/NChechulin/tim"
license=('MIT')
depends=('gcc-libs')
makedepends=()
conflicts=()
backup=()
source=("https://github.com/NChechulin/tim/releases/download/v${pkgver}/tim"
        "https://raw.githubusercontent.com/NChechulin/tim/master/LICENSE")
md5sums=('867a99f1ba2267eb311947281bbfe325'
         'b5a8a46f2c9142bdbfb1be8ac82a0bae')
validpgpkeys=()

package() {
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}

    install -Dm 755 ${srcdir}/tim ${pkgdir}/usr/bin/tim
    install -Dm 644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

