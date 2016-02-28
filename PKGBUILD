# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Yodaz, MagicSeb
pkgname=scangearmp-mg3500series
pkgver=2.20
pkgrel=1
pkgdesc="Canon IJ Scanner Driver (MG3500 series)"
arch=('i686' 'x86_64')
url="http://support-asia.canon-asia.com/contents/ASIA/EN/0100470402.html"
license=('custom')
depends=('scangearmp-common-mg3500series')
makedepends=('rpmextract')
options=('emptydirs')
source=("http://gdlp01.c-wss.com/gds/0/0100005520/01/${pkgname}-${pkgver}-${pkgrel}-rpm.tar.gz")
sha256sums=('0fe5b7827b11d52754fc25ed26836b09342b588289b7b87ec2335ff7b9f179f6')

package() {
    if [ "${CARCH}" = 'x86_64' ]; then
        rpmfile=$(find "$srcdir" -name ${pkgname}-${pkgver}*${CARCH}*.rpm)
    elif [ "${CARCH}" = 'i686' ]; then
        rpmfile=$(find "$srcdir" -name ${pkgname}-${pkgver}*i386*.rpm)
    fi

    cd ${pkgdir}
    rpmextract.sh ${rpmfile}
    mv usr/lib64 usr/lib
}
