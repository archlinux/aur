# Maintainer: Bert-Jan Fikse <s4mpl3d@gmail.com>
pkgname=wwd-dde
pkgver=0.2.4
pkgrel=1
epoch=
arch=(any)
url="https://github.com/whatwedo/dde"
depends=('docker' 'docker-compose' 'mutagen.io-bin' 'make')
source=("https://codeload.github.com/whatwedo/dde/zip/v${pkgver}")
md5sums=('7df9878521f62ee80b07e7dfb6e05643')
pkgdesc="Local development environment toolset based on Docker supporting multiple projects."


package () {
    mkdir -p ${srcdir}/usr/bin/
    echo make -f ${pkgdir}/opt/whatwedo/dde/Makefile > ${srcdir}/usr/bin/dde
    mkdir -p ${pkgdir}/opt/whatwedo/dde
    rsync -rtl ${srcdir}/dde-${pkgver}/* ${pkgdir}/opt/whatwedo/dde
    install -Dm755 ${srcdir}/usr/bin/dde ${pkgdir}/usr/bin/dde
}