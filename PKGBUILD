# Maintainer: Davi da Silva Böger <dsboger@gmail.com>
# Contributor: q3k <q3k AT q3k DOT org>

pkgname=lib32-libaudio2
pkgver=1.9.4
_pkgrel32=3
pkgrel=1
pkgdesc="A package that installs libaudio.so.2"
arch=('x86_64')
url="http://www.radscan.com/nas.html"
license=('custom')
groups=('lib32')
depends=('lib32-libxt')
makedepends=('pkgextract')
source=("http://security.ubuntu.com/ubuntu/pool/main/n/nas/libaudio2_${pkgver}-${_pkgrel32}_i386.deb" "LICENSE")

package() {
  bsdtar -xf data.tar.xz
  mkdir -p ${pkgdir}/usr/lib32
  cp -R ${srcdir}/usr/lib/i386-linux-gnu/libaudio* $pkgdir/usr/lib32/
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

sha512sums=('9918915d36fd181dccfd8416d31df744991f880e1ae7aa7659a5de49bfa873879063361d002eaf86e5c62aff350a5451553415129eb680f6ae3a557aa706958a' '26ca385b79639e7f834531bb7bb3694e8d43b814ddd8f5112039a51bef56d284ecca42700707cd66a8a699a40cb854ffbcf7e120cec83120811c1d74d65ecfb3')
