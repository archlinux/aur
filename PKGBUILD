# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=treeform
pkgver=1.0.3
pkgrel=2
pkgdesc='Linguistic Syntax/Semantics tree drawing editor'
arch=('any')
url='https://sourceforge.net/projects/treeform/'
license=('GPL2')
depends=('jre8-openjdk')
makedepends=('unzip')
source=('https://downloads.sourceforge.net/project/treeform/TreeForm%20Unified/TreeForm%201.0.3/TreeForm_1_0_3.zip' 'treeform.sh')
md5sums=('5c560fc47936a6b620ecfc74d18bd4b6'
         'c99add5f11fe94e65d5b49658d00c79f')

prepare() {
    cd "$srcdir/"
    unzip -f TreeForm_*.zip
    rm TreeForm/TreeForm.bat TreeForm/.DS_Store
}

package() {
    install -Dm 755 "treeform.sh" "$pkgdir/usr/bin/treeform"
    mkdir -p "$pkgdir/usr/share/"
    cp -r "$srcdir/TreeForm" "$pkgdir/usr/share/treeform"
}
