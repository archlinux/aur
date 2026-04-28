# Maintainer: Adam Schadler <ajschadler gmail.com>
# Contributor: Liam Timms <timms5000 gmail.com>
_localname=afni_atlases_dist
pkgname=afni-atlases
pkgver=2.02
pkgrel=1
pkgdesc="Collection of atlases for use in AFNI"
arch=("any")
url="http://afni.nimh.nih.gov"
license=('custom')
depends=()
optdepends=("afni")
source=("https://afni.nimh.nih.gov/pub/dist/atlases/afni_atlases_dist.tgz"
        "LICENSE::https://afni.nimh.nih.gov/pub/dist/src/README.copyright")
sha256sums=('e6c2f83eb630ff8e5626fe43c4d43292305c040592491cb5751ce65b4a34af63'
            '86d6a552038e50f15b618c16322cbb342d6c359cd77f3d9c826c220b7542e8e7')

pkgver () {
    cd $srcdir/$_localname
    tail -n 1 AFNI_atlases_history.txt | cut -f 1 -d ' '
}

package() {
    # clean up
    rm "$srcdir/$_localname"/AFNI_atlas*.{txt,niml}
    # Install files
    install -D "$srcdir/$_localname"/* -t "$pkgdir"/opt/afni
    install -D "$srcdir/LICENSE" -t "$pkgdir"/usr/share/licenses/$pkgname/
}
