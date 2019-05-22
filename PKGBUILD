# Maintainer: Simon Kronberg <Simon.Kronberg@gmail.com>
pkgname=waterfox-alpha-bin
pkgver=68.0a1
pkgrel=1
pkgdesc="64-bit optimised Firefox fork; no telemetry; supports XUL add-ons."
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'gtk3' 'sqlite' 'dbus-glib')
optdepends=('alsa-lib' 'pulseaudio')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('waterfox-alpha.desktop' 'https://storage-waterfox.netdna-ssl.com/Waterfox/aurora/Linux/waterfox-'"${pkgver}"'.en-US.linux-x86_64.tar.bz2')

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  install -m644 "${srcdir}"/waterfox-alpha.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${srcdir}"/waterfox/browser/chrome/icons/default/default128.png "${pkgdir}"/usr/share/pixmaps/waterfox-alpha-icon.png
  cp -r waterfox "${pkgdir}"/opt/waterfox-alpha
  ln -s /opt/waterfox-alpha/waterfox "${pkgdir}"/usr/bin/waterfox-alpha
}
md5sums=('4b385db944b4d72136ca5798be9bd7b4'
         'caf4bf111f0c5ec667251853b5cb6a46')
