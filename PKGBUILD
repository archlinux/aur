# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgdesc="Caleb's SILE publishing toolkit"
pkgver=0.0.0.r811.g5be9d6b
_branch='master'
pkgrel=1
arch=(any)
url='https://github.com/sile-typesetter/casile/'
license=('LGPL3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git://github.com/sile-typesetter/${pkgname%-git}.git#branch=$_branch")
sha512sums=('SKIP')
makedepends=('git')
depends=('bc'
         'cpdf'
         'entr'
         'epubcheck'
         'imagemagick'
         'inkscape'
         'jq'
         'kindlegen'
         'lua-colors'
         'lua-filesystem'
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
         'python-pantable'
         'python-ruamel-yaml'
         'python-usfm2osis-cw-git'
         'rsync'
         'sile'
         'sqlite'
         'tex-gyre-fonts'
         'texlive-core'
         'ttf-hack'
         'xcftools'
         'yarn'
         'yq'
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
