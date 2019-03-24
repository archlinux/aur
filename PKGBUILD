# Maintainer: Romain Bazile <gromain.baz@gmail.com>

pkgname=wpan-tools
pkgver=0.9
pkgrel=1
pkgdesc="Userspace tools for Linux IEEE 802.15.4 stack."
epoch=
arch=('x86_64' 'aarch64' 'armv7h')
url="http://wpan.cakelab.org/"
license=('ISC')
depends=('libnl')
provides=('iwpan' 'wpan-ping' 'wpan-hwsim')
source=("https://github.com/linux-wpan/wpan-tools/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

sha1sums=('9036163c483d2dd57bf536ff718a398f1d8a06ac')

package() {
        cd ${srcdir}/${pkgname}-${pkgver};
        ./configure;
        make;
        install -D -m555 ${srcdir}/${pkgname}-${pkgver}/src/iwpan ${pkgdir}/usr/bin/iwpan;
        install -D -m555 ${srcdir}/${pkgname}-${pkgver}/wpan-ping/wpan-ping ${pkgdir}/usr/bin/wpan-ping;
        install -D -m555 ${srcdir}/${pkgname}-${pkgver}/wpan-hwsim/wpan-hwsim ${pkgdir}/usr/bin/wpan-hwsim;
        install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE;
}
