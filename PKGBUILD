pkgname='chia-gui'
pkgver=1.0.5
pkgrel=1
pkgdesc="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure. - Also installs GUI, using system electron"
arch=('any')
url="https://www.chia.net/"
license=('Apache')
depends=('electron11')
conflicts=('chia' 'chia-gui')
provides=('chia' 'chia-gui')
options=('!strip')
source=("https://github.com/Chia-Network/chia-blockchain/releases/download/1.0.5/chia-blockchain_${pkgver}_amd64.deb"
        "chia-blockchain.png"
        "chia-blockchain")

        
package() {
  bsdtar -xf data.tar.xz -C ./
  install -d "${pkgdir}/usr/share"
  cp -r "usr/lib/chia-blockchain/resources" "${pkgdir}/usr/share/chia-blockchain"
  install -d "${pkgdir}/usr/share/chia-blockchain"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "usr/share/applications/chia-blockchain.desktop"
  install -Dm644 "chia-blockchain.png" "$pkgdir/usr/share/pixmaps/chia-blockchain.png"
  install -Dm755 "chia-blockchain" "${pkgdir}/usr/bin/chia-blockchain"
} 
md5sums=('bdc6439e529ae5ace22d7f045836f72c'
         '05797ff1f5ef580c7243e0182c822701'
         '8853d24b7c76a33a74b235999e270ef8')
