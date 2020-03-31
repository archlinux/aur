# Maintainer:  Caleb Maclennan <caleb@alerque.com>

pkgname=casile-git
pkgver=0.1.0.r59.g7ea80e7
pkgrel=2
pkgdesc='Caleb’s SILE publishing toolkit'
arch=('any')
url="https://github.com/sile-typesetter/${pkgname%-git}"
license=('LGPL3')
depends=('bc'
         'bcprov' # pdftk optdepend is required
         'cpdf'
         'entr'
         'epubcheck'
         'git'
         'imagemagick'
         'inetutils'
         'inkscape'
         'java-commons-lang' # pdftk optdepend is required
         'jq'
         'kindlegen'
         'lua-colors'
         'lua-filesystem'
         'lua-yaml'
         'm4'
         'make'
         'moreutils'
         'nodejs'
         'otf-libertinus'
         'pandoc-sile-git'
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
provides=("${pkgname%-git}")
conflicts=("${provides[@]}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package () {
    cd "${pkgname%-git}"
    install -dm755 "$pkgdir/usr/share"
    cp -a ./ "$pkgdir/usr/share/${pkgname%-git}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
