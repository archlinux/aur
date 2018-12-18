# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgdesc="Caleb's SILE publishing toolkit"
pkgver=0.0.0.r603.g51f263c
_branch='master'
pkgrel=2
arch=(any)
url='https://github.com/alerque/casile/'
license=('LGPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/alerque/${pkgname%-git}.git#branch=$_branch")
sha512sums=('SKIP')
makedepends=('git')
depends=('bc'
         'cpdf'
         'entr'
         'imagemagick>=7.0'
         'inkscape'
         'jq'
         'kindlegen'
         'lua-yaml'
         'm4'
         'moreutils'
         'nodejs'
         'otf-libertinus'
         'pandoc'
         'pcre'
         'pdftk'
         'perl-yaml'
         'perl-yaml-merge-simple'
         'podofo'
         'poppler'
         'povray'
         'python-isbnlib'
         'python-pandocfilters'
         'python-usfm2osis-cw-git'
         'python-yaml'
         'rsync'
         'sile-git>=0.9.4.r532'
         'tex-gyre-fonts'
         'ttf-hack'
         'yarn'
         'zint'
         'zsh')

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
