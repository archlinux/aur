# Maintainer:  <take100yen@gmail.com>
pkgname=skk-jisyo-git
pkgver=r50.3085e8d
epoch=1
pkgrel=1
pkgdesc='SKK Dictionaries (Git version)'
arch=('any')
url='https://github.com/skk-dev/dict'
provides=('skk-jisyo')
conflicts=('skk-jisyo')
optdepends=('skktools: Dictionary maintenance tools')
license=('GPL')
source=('git+https://github.com/skk-dev/dict.git')
md5sums=('SKIP')
pkgver(){
    cd dict
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
    cd dict
    install -d $pkgdir/usr/share/skk
    install SKK-JISYO.* $pkgdir/usr/share/skk/
    cp zipcode/SKK-JISYO* $pkgdir/usr/share/skk/
    install -d $pkgdir/usr/share/license/$pkgname/
    install edict_doc.txt $pkgdir/usr/share/license/$pkgname/
}
