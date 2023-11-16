# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=writerscafe
pkgver=2.44
pkgrel=2
pkgdesc="A set of power tools for all fiction writers, whether experienced or just starting out"
url="http://www.anthemion.co.uk/writerscafe/"
license=("custom")
arch=('x86_64')
depends=('gtk2')
source_x86_64=(http://www.anthemion.co.uk/writerscafe/WritersCafe-${pkgver}-ubuntu-x86_64.tar.gz "${pkgname}".sh)
sha256sums_x86_64=('abd9bcc56ea458a5202a8e9d9e125167538a351bc50acd2a42709f9a0f2700c1'
                   '645b88a294043452fa72a508acb46eead006d207ae8e7702a3772da90c5f68ff')

package() {
    cd "${srcdir}"
    mkdir out
    tar -xzf WritersCafeData.tar.gz -C out

    install -dm755 "${pkgdir}"/usr/share/writerscafe2
    install -D -m755 "${srcdir}"/writerscafe.sh "${pkgdir}"/usr/bin/writerscafe2

    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/applications
    mkdir -p "${pkgdir}"/usr/share/pixmaps

    cp -R "${srcdir}"/out/* "${pkgdir}"/usr/share/writerscafe2
    cp "${pkgdir}"/usr/share/writerscafe2/writerscafe2.desktop "${pkgdir}"/usr/share/applications/writerscafe2.desktop
    cp "${pkgdir}"/usr/share/writerscafe2/appicons/writerscafe128x128.png "${pkgdir}"/usr/share/pixmaps/writerscafe2.png
}
