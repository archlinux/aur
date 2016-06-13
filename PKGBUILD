# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic dragos240

pkgname=rescuetime
pkgver=2.9.10.1255
pkgrel=1
pkgdesc="Application time-tracking for Linux. Stable version"
arch=(i686 x86_64)
url=https://www.rescuetime.com
license=(GPL2)
depends=(qt4 xorg-xprop xprintidle)
conflicts=($pkgname-beta)
install=$pkgname.install
changelog=$pkgname.changelog

if [[ $CARCH == "x86_64" ]]
then
    _suffix=amd64
md5sums=('bd81f31fbb13a5b73ac5bf41bbf243f6')
else
    _suffix=i386
md5sums=('79ef7170b5e047712751fa769fd21465')
fi

source=($url/installers/rescuetime_current_$_suffix.deb)

package() {
    bsdtar -xf data.tar.gz
    install -Dm755 usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 usr/share/$pkgname/curl-ca-bundle.crt "$pkgdir"/usr/share/$pkgname/curl-ca-bundle.crt
}
