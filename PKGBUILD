pkgname=matlab-documentation
pkgver=24.1.0.2508561
pkgrel=1
pkgdesc="MATLAB documentation"
arch=('any')
url="https://www.mathworks.com/help/releases/R2024a/install/ug/install-documentation-on-offline-machines.html"
license=('custom')
source=('R2024a_Doc_Linux.iso::https://www.mathworks.com/doc-iso-r2024a-linux')
md5sums=('e22b320bb5dc4dbc542281583a7016be')

pkgver() {
    sed --quiet 's|\s*<version>\(.*\)</version>\s*|\1|p' "$srcdir/VersionInfo.xml"
}

package() {
    mkdir -p $pkgdir/opt/MATLAB/R2024a
    $srcdir/bin/glnxa64/mpm install-doc --matlabroot="/opt/MATLAB/R2024a" --destination="$pkgdir/opt/MATLAB/R2024a"
}
