# Maintainer: Adam Schadler <ajschadler gmail.com>
# Contributor: Liam Timms <timms5000 gmail.com>
_localname=afni_atlases_dist
pkgname=afni-atlases
pkgver=1.06
pkgrel=1
pkgdesc="Collection of atlases for use in AFNI"
arch=("any")
url="http://afni.nimh.nih.gov"
license=('custom')
depends=()
optdepends=("afni")
source=("https://afni.nimh.nih.gov/pub/dist/atlases/afni_atlases_dist.tgz"
        "LICENSE::https://afni.nimh.nih.gov/pub/dist/src/README.copyright")
sha256sums=('87fbb5a39f9f54198f3a49684f6f013a57cdbdde0047388906bb278c42ccfc92'
            '86d6a552038e50f15b618c16322cbb342d6c359cd77f3d9c826c220b7542e8e7')

package() {
    # Clean up
    rm $srcdir/$_localname/README*
    rm $srcdir/$_localname/*{html,csh,txt}

    # Install files
    install -D "$srcdir/$_localname"/* -t "$pkgdir"/opt/afni
    install -D "$srcdir/LICENSE" -t "$pkgdir"/usr/share/licenses/$pkgname/
}
