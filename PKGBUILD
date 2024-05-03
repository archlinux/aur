# Maintainer: Adam Schadler <ajschadler gmail.com>
# Contributor: Liam Timms <timms5000 gmail.com>
_localname=afni_atlases_dist
pkgname=afni-atlases
pkgver=2.01
pkgrel=1
pkgdesc="Collection of atlases for use in AFNI"
arch=("any")
url="http://afni.nimh.nih.gov"
license=('custom')
depends=()
optdepends=("afni")
source=("https://afni.nimh.nih.gov/pub/dist/atlases/afni_atlases_dist.tgz"
        "LICENSE::https://afni.nimh.nih.gov/pub/dist/src/README.copyright")
sha256sums=('4e0077de8234db0bec7a7f25cbb3e34de842269c55a4132aa47aa5c2324911f7'
            '86d6a552038e50f15b618c16322cbb342d6c359cd77f3d9c826c220b7542e8e7')

package() {
    # clean up
    rm "$srcdir/$_localname"/AFNI_atlas*.{txt,niml} \
       "$srcdir/$_localname/index.html"
    # Install files
    install -D "$srcdir/$_localname"/* -t "$pkgdir"/opt/afni
    install -D "$srcdir/LICENSE" -t "$pkgdir"/usr/share/licenses/$pkgname/
}
