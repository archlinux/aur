# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo-bin
pkgver=0.9.0_rc4
pkgrel=1
pkgdesc='Shell-centric cross-platform open source MongoDB management tool'
arch=('x86_64')
url='http://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'libxkbcommon-x11' 'pcre' 'openssl')
conflicts=('robomongo')
_tarfile='robomongo-0.9.0-rc4-linux-x86_64-8c830b6'
source=("http://download.robomongo.org/0.9.0-rc4/linux/${_tarfile}.tar.gz"
        'https://raw.githubusercontent.com/paralect/robomongo/master/src/robomongo/gui/resources/icons/logo.png'
        'robomongo.desktop')
sha256sums=('4f0080faa498a6cc7622146532b268586c5d181c79a199114f4ca74c17ff016d'
            '62afd8e83603f0785b21ec8692f6945438e00faf068e35dd9c00986e46419196'
            'bdd63f5d4bd35dd865a0164f285d19555e4ecafb2d11d01f67bdb86bd730a13d')

package() {
  install -Dm0755 "$srcdir/${_tarfile}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "$srcdir/robomongo.desktop" "$pkgdir/usr/share/applications/robomongo.desktop"
  install -Dm0644 "$srcdir/logo.png" "$pkgdir/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "$srcdir/${_tarfile}/LICENSE" "$pkgdir/usr/share/licenses/robomongo/LICENSE"
}
