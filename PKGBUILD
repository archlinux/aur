# Maintainer: Vyacheslav Konovalov <vyachkonovalov@gmail.com>

pkgname=robomongo-bin
pkgver=0.9.0_rc7
pkgrel=1
pkgdesc='Shell-centric cross-platform open source MongoDB management tool'
arch=('x86_64')
url='https://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'pcre' 'qjson')
conflicts=('robomongo')
_tarfile='robomongo-0.9.0-rc7-linux-x86_64-2b7a8ca'
source=("https://download.robomongo.org/0.9.0-rc7/linux/${_tarfile}.tar.gz"
        'https://raw.githubusercontent.com/paralect/robomongo/master/src/robomongo/gui/resources/icons/logo.png'
        'robomongo.desktop')
sha256sums=('5c84d55ada0684ef4624fab44a771f80e467c7a7ecb02f41442e9172b4af0c4c'
            '62afd8e83603f0785b21ec8692f6945438e00faf068e35dd9c00986e46419196'
            '90912e3628e56248b970cd38bfc41098c7315d86f4fc3783e5483a1e794b89aa')

package() {
  install -Dm0755 "$srcdir/${_tarfile}/bin/robomongo" "$pkgdir/usr/bin/robomongo"
  install -Dm0644 "$srcdir/robomongo.desktop" "$pkgdir/usr/share/applications/robomongo.desktop"
  install -Dm0644 "$srcdir/logo.png" "$pkgdir/usr/share/pixmaps/robomongo.png"
  install -Dm0644 "$srcdir/${_tarfile}/LICENSE" "$pkgdir/usr/share/licenses/robomongo/LICENSE"
  install -Dm0644 "$srcdir/${_tarfile}/COPYRIGHT" "$pkgdir/usr/share/doc/robomongo/COPYRIGHT"
}
