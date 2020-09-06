# Maintainer: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>

pkgname=robo3t-bin
pkgver=1.4.0
pkgrel=2
pkgdesc='Shell-centric MongoDB management tool'
arch=('x86_64')
url='https://robomongo.org/'
license=('GPLv3')
depends=('qt5-base' 'openssl-1.0' 'libcurl-gnutls')
conflicts=('robo3t')
_filename="robo3t-$pkgver-linux-x86_64-12e54cc"
source=("https://download.studio3t.com/robomongo/linux/$_filename.tar.gz"
        'https://raw.githubusercontent.com/Studio3T/robomongo/master/src/robomongo/gui/resources/icons/logo-256x256.png'
        'robo3t.desktop')
sha256sums=('5e0da4e644a08c8abf67212bd2c1cb99e445b1ad6d6871125b816c36ba81a4e9'
            'a63c4b244c451e2e881934119e435d6ce54ce8157dac724753143b48e6652eb7'
            '7d373a219df170d774431d5118432bcc7adc01aee07733972e651cd1a4dfb619')

package() {
    install -Dm644 logo-256x256.png "$pkgdir/usr/share/pixmaps/robo3t.png"
    install -Dm644 robo3t.desktop -t "$pkgdir/usr/share/applications"

    cd $_filename
    install -Dm755 bin/robo3t -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/robo3t"
    install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/doc/robo3t"
}
