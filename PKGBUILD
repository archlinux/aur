# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: GI_Jack <iamjacksemail@hackermail.com>

pkgname=nkiller2
pkgver=2.0
pkgrel=2
pkgdesc='A TCP exhaustion/stressing tool.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://sock-raw.org/projects.html'
license=('GPLv3')
depends=('openssl' 'libpcap')
source=('https://sock-raw.org/projects/nkiller2/nkiller2.c')
sha512sums=('baae5002da80baa90039075a5496770bc211da4cd2e33ea2623343fff1c10efd79235d0a85fbc6caca6a555de2a6063f6d00e57aadb2926c418186dfa849b410')

build() {
  cd "${srcdir}"
  gcc ${pkgname}.c -o ${pkgname} -lssl -lcrypto -lpcap -O2 -D_DEFAULT_SOURCE
}

package() {
  cd "${srcdir}"
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
