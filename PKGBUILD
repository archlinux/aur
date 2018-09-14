# Creator: Herbert Knapp <herbert.knapp@edu.uni-graz.at>
# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=waterfox-bin
pkgver=56.2.3
pkgrel=1
pkgdesc="64-Bit optimized Firefox, no data collection, allows unsigned extensions"
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=('alsa-lib' 'pulseaudio')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('waterfox.desktop' 'https://storage-waterfox.netdna-ssl.com/releases/linux64/installer/waterfox-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  install -m644 "${srcdir}"/waterfox.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${srcdir}"/waterfox/browser/icons/mozicon128.png "${pkgdir}"/usr/share/pixmaps/waterfox-icon.png
  cp -r waterfox "${pkgdir}"/opt/
  ln -s /opt/waterfox/waterfox "${pkgdir}"/usr/bin/
}
sha512sums=('a7ece8f3f8ab8f5205d0acd863365ce9d7965550e8231ded380a89d8e5d2a220992380bdbc3a1f59f72588d40f82358b38ce7b3456c6f7c0066c13779b58ee85'
            'c822bc6d42fcf1d04db0665b9964baa9351adcfd09ce6926faf59b4ae83fc7a0af536bb5a64179b44f69ddb9f849dc29c3bb7111c748fba9652c46bb99e53cc4')
