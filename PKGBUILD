# Maintainer: pcmid <plzcmid@gmail.com>

pkgname=robo3t-1.2-bin
_pkgver=1.2.1
pkgver=${_pkgver/-/_}
pkgrel=2
pkgdesc='Shell-centric MongoDB management tool'
arch=('x86_64')
url='https://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'pcre' 'openssl-1.0')
replaces=('robomongo-bin')
conflicts=('robo3t' 'robomongo')
_tarfile="robo3t-${_pkgver}-linux-x86_64-3e50a65"
source=("https://download.robomongo.org/${_pkgver}/linux/${_tarfile}.tar.gz"
        'https://raw.githubusercontent.com/Studio3T/robomongo/master/src/robomongo/gui/resources/icons/logo-256x256.png'
        'robo3t.desktop')
sha256sums=('2ac31b5c1a489f0e04582c3ffed592328e0b3d7a8163520f8fefcd58f1bd0deb'
            'a63c4b244c451e2e881934119e435d6ce54ce8157dac724753143b48e6652eb7'
            'c9d0123bab9c6101cb3d0ace98079de6b596a0e51b0c3b74d8a1bc48fed825c7')

PKGEXT='.pkg.tar.zst'
COMPRESSZST=(zstd -c -T0 --ultra -21 -)

package() {
  install -Dm0755 "$srcdir/${_tarfile}/bin/robo3t" "$pkgdir/usr/bin/robo3t"
  install -Dm0644 "$srcdir/robo3t.desktop" "$pkgdir/usr/share/applications/robo3t.desktop"
  install -Dm0644 "$srcdir/logo-256x256.png" "$pkgdir/usr/share/pixmaps/robo3t.png"
  install -Dm0644 "$srcdir/${_tarfile}/LICENSE" "$pkgdir/usr/share/licenses/robo3t/LICENSE"
  install -Dm0644 "$srcdir/${_tarfile}/COPYRIGHT" "$pkgdir/usr/share/doc/robo3t/COPYRIGHT"
}
