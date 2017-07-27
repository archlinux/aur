# Maintainer: Olaf Leidinger <oleid@mescharet.de>
#
# Get the CentOS tarball from https://www.codeplay.com/products/computesuite/computecpp/download
pkgname=computecpp
pkgver=0.2.1
pkgrel=1
pkgdesc="Accelerates Complex C++ Applications on Heterogeneous Compute 
Systems using Open Standards"
arch=('x86_64')
url="https://www.codeplay.com/products/computesuite"
license=('EULA')
source=("file://ComputeCpp-CE-${pkgver}-CentOS-64bit.tar.gz")
sha256sums=('e7e301bcd8906b419d0067c262dc0eac987798da9dbac4763d285c1e9bf8ddec')

package() {
    _pkgbasename=ComputeCpp-CE-${pkgver}-Linux
    cd "$srcdir"
    mkdir -p "$pkgdir/opt"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc/ld.so.conf.d"

    mv ${_pkgbasename} "$pkgdir/opt"

    ln -s /opt/${_pkgbasename}/bin/compute++ "$pkgdir/usr/bin"
    ln -s /opt/${_pkgbasename}/bin/computecpp_info "$pkgdir/usr/bin"

    echo /opt/${_pkgbasename}/lib > "$pkgdir/etc/ld.so.conf.d/computecpp.conf"
}
