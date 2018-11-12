#Maintainer : vheeze at yandex dot com
#From OpenOffice dictionary. Converted to UTF-8

pkgname=hunspell-th
pkgver=1.0.0
pkgrel=1
pkgdesc="Thai hunspell dictionary"
arch=(any)
url="https://github.com/tafasu/aegisub-thai-dict"
license=('LGPL2')
makedepends=('hunspell')
optdepends=('hunspell:	the spell checking libraries and apps')
source=("https://github.com/tafasu/aegisub-thai-dict/archive/master.zip")
sha256sums=('0e1e7081354669e8ee7158778099400a75a52528e067503fba0976d49cf83dbc')

package(){

    #copy hunspell
    cd "${srcdir}"
    install -dm755 "${pkgdir}"/usr/share/hunspell
    cp -p aegisub-thai-dict-master/th_TH.aff "${pkgdir}"/usr/share/hunspell/th_TH.aff
    cp -p aegisub-thai-dict-master/th_TH.dic "${pkgdir}"/usr/share/hunspell/th_TH.dic



    #myspell symlinks
    install -dm755 "${pkgdir}"/usr/share/myspell/dicts
    pushd "${pkgdir}"/usr/share/myspell/dicts
        for file in "${pkgdir}"/usr/share/hunspell/*; do
            ln -sv /usr/share/hunspell/"$(basename "${file}")" .
        done
    popd


}
