# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgdesc="Caleb's SILE publishing toolkit"
pkgver=0.0.0.r319.g3650731
_branch='master'
pkgrel=4
arch=(any)
url='https://github.com/alerque/casile/'
license=('LGPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/alerque/${pkgname%-git}.git#branch=$_branch")
sha512sums=('SKIP')
makedepends=('git')
depends=('cpdf'
        'entr'
        'haskell-pandoc'
        'imagemagick7'
        'inkscape'
        'kindlegen'
        'otf-libertinus'
        'pdftk'
        'podofo'
        'poppler'
        'povray'
        'python-usfm2osis-cw-git'
        'rsync'
        'sile-git>=0.9.4.r361'
        'ttf-hack'
        'zint')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p "$pkgdir/usr/share"
    cp -a ./ "$pkgdir/usr/share/casile"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
