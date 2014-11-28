# $Id: $
# Maintainer: Paulo Matias <matiasΘarchlinux-br·org>

pkgname="qirssi"
pkgver="20090305"
pkgrel=1
pkgdesc="A Qt trayicon and notifier for irssi"
url="http://code.google.com/p/qirssi"
arch=('i686' 'x86_64')
license=('BSD')
depends=('qt' 'irssi' 'screen')
source=("http://qirssi.googlecode.com/files/$pkgname-$pkgver.tar.gz" LICENSE)
md5sums=('96ff164721d6b293e37f0dffdcfa43f2'
         '1c2fd6de6283a135030535a6c753c023')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    qmake qirssi.pro || return 1
    make || return 1

    install -Dsm755 qirssi "${pkgdir}/usr/bin/qirssi" || return 1
    install -Dm644 qirssi.pl "${pkgdir}/usr/share/irssi/scripts/qirssi.pl" || return 1
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
