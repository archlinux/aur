# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Otto Sabart <seberm@gmail.com>

pkgname=sshdfilter
pkgver=1.5.7
pkgrel=2
pkgdesc="SSH brute force attack blocker"
arch=('any')
url="http://freecode.com/projects/sshdfilter"
license=('GPL')
depends=('openssh' 'perl')
install=$pkgname.install
source=(http://fossies.org/linux/privat/$pkgname-$pkgver.tar.gz \
        $pkgname sshdfilterrc)
sha256sums=('19252f789b8eb39a39cb4ea27f64c4ba5e1822bd75d1daddca95a297f1d9ea9e'
            '6889146d0e10bcccb7bf1cf391ce7a64164da3a1b33dd609ed290a0699e214c5'
            'ba9e84af5153835b2332a090e4d9ca7dffa60123e8d133cec3467a4fe1e04190')

package() {
cd "${srcdir}"/$pkgname-$pkgver

# install the script
  install -D -m755 source/$pkgname.pl "${pkgdir}"/usr/bin/$pkgname

# install configs
  install -D -m644 "${srcdir}"/sshdfilterrc "${pkgdir}"/etc/sshdfilterrc

# install mans
  install -D -m644 man/sshdfilter.1 "${pkgdir}"/usr/share/man/man1/sshdfilter.1
  install -D -m644 man/sshdfilterrc.5 "${pkgdir}"/usr/share/man/man5/sshdfilterrc.5

# install the rc script
#  install -D -m755 "${srcdir}"/$pkgname "${pkgdir}"/etc/rc.d/$pkgname
}
