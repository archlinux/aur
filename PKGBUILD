# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=jsonlab
pkgver=1.5
pkgrel=1
pkgdesc="A toolbox to encode/decode JSON files in Matlab/Octave"
arch=("any")
url="https://github.com/fangq/jsonlab"
license=('BSD')
source=("$pkgname-$pkgver.zip::https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/33381/versions/22/download/zip")
sha256sums=('79470b0d65fe272306cf523af4558a81d8682c691669a51fcaeac6e89896afbb')

package() {
    install -d "$pkgdir"/opt/$pkgname
    cp -r "$srcdir"/$pkgname-$pkgver/* "$pkgdir"/opt/$pkgname
    find "$pkgdir"/opt/$pkgname -type f -exec chmod 644 "{}" \;

    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s /opt/$pkgname/README.txt "$pkgdir"/usr/share/doc/$pkgname

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /opt/$pkgname/LICENSE_BSD.txt "$pkgdir"/usr/share/licenses/$pkgname
}
