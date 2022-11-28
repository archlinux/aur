# Maintainer: Sergio Schneider <spsf64 =at= gmail =dot= com>
# Contributor: ThomasQBS

pkgname=cinnamon-sounds
pkgver=1.6.5
pkgrel=1
pkgdesc="Cinnamon desktop sounds extracted from Linuxmint (mint-artwork)"
arch=('any')
# url="https://www.linuxmint.com"
url="http://packages.linuxmint.com"
license=('GPL')
depends=('cinnamon')
conflicts=('mint-artwork' 'mint-sounds' 'cinnamon-sound-effects' 'mint-artwork-cinnamon')
source=("http://packages.linuxmint.com/pool/main/m/mint-artwork/mint-artwork_${pkgver}.tar.xz")
sha256sums=('40ffa8f9a2455acd1b600b1ccc4fc2be607287fe4ad9b098314922452a7db766')

package() {
	install="${pkgname}.install"
    install -d "$pkgdir/usr/share/sounds"
    rm "$srcdir/mint-artwork/usr/share/sounds/linuxmint-logout.wav"
    rm "$srcdir/mint-artwork/usr/share/sounds/linuxmint-login.wav"
    rm "$srcdir/mint-artwork/usr/share/sounds/linuxmint-gdm.wav"
    cp -r mint-artwork/usr/share/sounds/* "$pkgdir/usr/share/sounds/"
    cp -r mint-artwork/usr/share/mint-artwork/sounds/* "$pkgdir/usr/share/sounds/LinuxMint/stereo/"
}

