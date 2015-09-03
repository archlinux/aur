# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: kaptoxic

pkgname=rescuetime
pkgver=2.8.9.1185
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
sha1sums=('faf662813356cfd6443aa0d361d65d1b50534345')
else
    _suffix=i386
fi

source=($url/installers/rescuetime_current_$_suffix.deb)

package() {
    bsdtar -xf data.tar.gz
    install -Dm755 usr/bin/$pkgname "$pkgdir"/usr/bin/$pkgname
}
