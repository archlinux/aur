# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: btg <btgunes@gmail.com>

pkgname=hunspell-tr
pkgver=0.1
pkgrel=5
pkgdesc="Turkish Dictionary for Hunspell"
arch=('any')
url='https://code.google.com/archive/p/tr-spell/downloads'
license=('LGPL' 'BSD')
depends=('hunspell')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/tr-spell/Hunspell_tr_TR_v.$pkgver.zip")
sha256sums=('894d35f3242f47251ef729d4ea091f44364d8c5b0f237c0c5a8ac2b2148f1136')

package() {
    install -D -m644 tr.dic "$pkgdir"/usr/share/hunspell/tr_TR.dic
    install -D -m644 tr.aff "$pkgdir"/usr/share/hunspell/tr_TR.aff
    install -D -m644 README "$pkgdir"/usr/share/doc/hunspell-tr/README
    install -dm755 "$pkgdir"/usr/share/myspell/dicts
    cd "$pkgdir"/usr/share/myspell/dicts
    for file in "$pkgdir"/usr/share/hunspell/*; do
        ln -sv /usr/share/hunspell/"$(basename "$file")" .
    done
}
