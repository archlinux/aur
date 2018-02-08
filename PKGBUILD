# Maintainer: Romain Bazile <gromain.baz@gmail.com>

pkgname=wpan-tools
pkgver=0.8
pkgrel=0
pkgdesc="Userspace tools for Linux IEEE 802.15.4 stack."
epoch=
arch=('x86_64' 'aarch64')
url="http://wpan.cakelab.org/"
license=('ISC')
depends=('libnl')
provides=('iwpan' 'wpan-ping')
source=("https://github.com/linux-wpan/wpan-tools/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha1sums=('c0504e7c7e8064ca93395bb59a2857361b8f23f4')

package() {
        cd ${srcdir}/${pkgname}-${pkgver};
        ./configure;
        make;
        install -D -m555 ${srcdir}/${pkgname}-${pkgver}/src/iwpan ${pkgdir}/usr/bin/iwpan;
        install -D -m555 ${srcdir}/${pkgname}-${pkgver}/wpan-ping/wpan-ping ${pkgdir}/usr/bin/wpan-ping;
        install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
