# Maintainer: Yarema aka Knedlyk <yupadmin@gmail.com>
pkgname=run-reduce-deb
pkgver=3.1
pkgrel=1
pkgdesc="A Java GUI frontend for REDUCE"
arch=('any')
url="https://github.com/fjwright/Run-REDUCE"
license=('GPL3')
makedepends=('java-environment>=16' 'tar')
#conflicts=('')
provides=('run-reduce')
depends=('java-environment>=16')
source=("https://github.com/fjwright/Run-REDUCE/releases/download/v3.1/run-reduce_${pkgver}-1_amd64.deb")
sha256sums=('a25c70f68b054469bf95aa80537a0b9746a983dc21e1a388ce903169fcb72804')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s /opt/run-reduce/bin/Run-REDUCE "${pkgdir}/usr/bin/run-reduce"
} 
