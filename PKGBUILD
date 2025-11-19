# Maintainer: Sergio Schneider <spsf64 =at= msn =dot= com>
# Contributor: ThomasQBS

pkgname=cinnamon-sounds
pkgver=1.9.2
pkgrel=1
pkgdesc="Cinnamon desktop sounds extracted from Linuxmint (mint-artwork)"
arch=('any')
#url="https://github.com/linuxmint/"
url="http://packages.linuxmint.com"

license=('GPL')
optdepends=('cinnamon')
conflicts=('mint-artwork' 'mint-sounds' 'cinnamon-sound-effects' 'mint-artwork-cinnamon')
source=("http://packages.linuxmint.com/pool/main/m/mint-artwork/mint-artwork_${pkgver}.tar.xz"
        "cinnamon-sounds.install")

sha256sums=('ce6569cbb4f5032544e67c03d1a67fffd90814ad88623977ad2abef5b7073c31'
            'd74b6c04f500c3c1c705c4f490801b669c8ee3a7612dea840a575aaa2d7961dc')

package() {
  install="${pkgname}.install"
  install -d "$pkgdir/usr/share/sounds"
  rm "$srcdir/mint-artwork/usr/share/sounds/linuxmint-logout.wav"
  rm "$srcdir/mint-artwork/usr/share/sounds/linuxmint-login.wav"
  rm "$srcdir/mint-artwork/usr/share/sounds/linuxmint-gdm.wav"
  cp -r mint-artwork/usr/share/sounds/* "$pkgdir/usr/share/sounds/"
  cp -r mint-artwork/usr/share/mint-artwork/sounds/* "$pkgdir/usr/share/sounds/LinuxMint/stereo/"
}

