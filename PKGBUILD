# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo-bin
pkgver=0.9.0_rc6
pkgrel=1
pkgdesc='Shell-centric cross-platform open source MongoDB management tool'
arch=('x86_64')
url='https://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'pcre' 'qjson')
conflicts=('robomongo')
_tarfile='robomongo-0.9.0-rc6-linux-x86_64-98af4fc'
source=("https://download.robomongo.org/0.9.0-rc6/linux/${_tarfile}.tar.gz"
        'https://raw.githubusercontent.com/paralect/robomongo/master/src/robomongo/gui/resources/icons/logo.png'
        'robomongo.desktop')
sha256sums=('5f6e71e9227c7752f8e80d3502e84e87c037d2d5f102949b48f333a1af6941c7'
            '62afd8e83603f0785b21ec8692f6945438e00faf068e35dd9c00986e46419196'
            'bdd63f5d4bd35dd865a0164f285d19555e4ecafb2d11d01f67bdb86bd730a13d')

package() {
  install -Dm0755 "$srcdir/${_tarfile}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "$srcdir/robomongo.desktop" "$pkgdir/usr/share/applications/robomongo.desktop"
  install -Dm0644 "$srcdir/logo.png" "$pkgdir/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "$srcdir/${_tarfile}/LICENSE" "$pkgdir/usr/share/licenses/robomongo/LICENSE"
  install -Dm0644 "$srcdir/${_tarfile}/COPYRIGHT" "$pkgdir/usr/share/doc/robomongo/COPYRIGHT"
}
