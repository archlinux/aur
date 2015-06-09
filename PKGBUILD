# Maintainer: Kirill Gagarski <gagarski at kspt.icc.spbstu.ru>
# Original author: ltwood <???>
pkgname=texlive-mais
pkgver=20130923
pkgrel=2
pkgdesc="LaTeX classes for Modeling and Analysis of Information Systems journal (includes both russian and english versions)"
arch=('any')
url="http://mais.uniyar.ac.ru/en/node/13"
license=('unknown')
provides=('petrify')
source=(http://mais.uniyar.ac.ru/sites/default/files/journal/mais.zip http://mais.uniyar.ac.ru/sites/default/files/journal/maiseng.zip texlive-mais.install)
makedepends=('unzip')
depends=('texlive-core' 'texlive-langcyrillic')
provides=('texlive-mais')
conflicts=('texlive-mais')
install=texlive-mais.install
build() {
    unzip $srcdir/mais.zip -d mais
    unzip $srcdir/maiseng.zip -d maiseng
    mkdir -p "$pkgdir/usr/share/texmf-dist/tex/latex/"
    cp -r $srcdir/mais $srcdir/maiseng "$pkgdir/usr/share/texmf-dist/tex/latex/"
}
md5sums=('cb530f0f827d419d8e69d5d359cbcce4'
         '79eb91cfb3c35d8c61276b90634e9a0a'
         '63dcf3fda6d572bf123340a401b63de1')
