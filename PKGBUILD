pkgname=matlab-documentation
pkgver=23.2.0.2475363
pkgrel=1
pkgdesc="MATLAB documentation"
arch=('any')
url="https://www.mathworks.com/help/releases/R2023b/install/ug/install-documentation-on-offline-machines.html"
license=('custom')
source=('R2023b_Doc_Linux.iso::https://www.mathworks.com/doc-iso-r2023b-linux')
md5sums=('0b03d247e16403a9e17df76129398fe6')

pkgver() {
    sed --quiet 's|\s*<version>\(.*\)</version>\s*|\1|p' "$srcdir/VersionInfo.xml"
}

package() {
    mkdir -p $pkgdir/opt/MATLAB/R2023b
    $srcdir/bin/glnxa64/mpm install-doc --matlabroot="/opt/MATLAB/R2023b" --destination="$pkgdir/opt/MATLAB/R2023b"
}
