# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=circstat
pkgver=2012a
pkgrel=3
pkgdesc="The circular statistics toolbox for Matlab/Octave"
arch=("any")
url="http://bethgelab.org/software/circstat"
license=('custom')
source=("$pkgname-$pkgver.zip::https://uk.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/10676/versions/22/download/zip")
sha256sums=('9c47637b92876bfa7a7c4ddf4adf5e5e266229c69ae83afd8bc8ec9c9699cdbb')

package() {
    install -d "$pkgdir"/opt/$pkgname
    rm "$srcdir"/*.zip
    cp -r "$srcdir"/* "$pkgdir"/opt/$pkgname

    # fix permissions
    find "$pkgdir"/opt/$pkgname -type f -exec chmod 644 "{}" \;

    # fix line endings
    find "$pkgdir"/opt/$pkgname -type f -not -name '*.mat' -exec sed -i 's/\r//' "{}" \;

    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s /opt/$pkgname/readme.txt "$pkgdir"/usr/share/doc/$pkgname

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /opt/$pkgname/license.txt "$pkgdir"/usr/share/licenses/$pkgname
}
