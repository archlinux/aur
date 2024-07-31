# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=intiface-desktop-bin
pkgver=27.0.0
pkgrel=1
pkgdesc="Open-source, cross-platform application that acts as a hub for sex hardware access"
arch=(x86_64)
url="https://github.com/intiface/intiface-desktop/"
license=('BSD-3-Clause')
depends=('alsa-lib' 'gtk3' 'nss-hg')
provides=('intiface-desktop')
source=("${url}releases/download/v${pkgver}/intiface-desktop-${pkgver}-linux-x64.tar.gz" "https://raw.githubusercontent.com/intiface/intiface-desktop/master/LICENSE" "intiface-desktop.png::https://raw.githubusercontent.com/intiface/intiface-desktop/master/packages/intiface/build/icon.png" "intiface-desktop.desktop")
sha256sums=("b019e38be61a817b0b0db55d54039b7a1d45b0a49c88f3ebf0c362d49b5608e2" "9cd7bf902f29cad83585d79576c2349aa83e9e34950ed09c5dd78ded41b22b35" "0beeac6741afeef8a29538e3c277174f57b0b172ea60cd6351b5b720df894248" "SKIP")

package() {
#used to clear prior extraction if exists
if [ -d "intiface-desktop" ]; then
  rm -R "intiface-desktop"
fi
mv "intiface-desktop-${pkgver}-linux-x64" "intiface-desktop"
install -d "${pkgdir}/opt/"
cp -R "intiface-desktop" "${pkgdir}/opt/"
install -d "${pkgdir}/usr/bin"
ln -s "/opt/intiface-desktop/intiface-desktop" "${pkgdir}/usr/bin/intiface-desktop"
install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/intiface-desktop-bin/LICENSE"
install -Dm755 "intiface-desktop.desktop" "${pkgdir}/usr/share/applications/intiface-desktop.desktop"
install -Dm755 "intiface-desktop.png" "${pkgdir}//usr/share/pixmaps/intiface-desktop.png"
}
