# Maintainer: pj1031999 <pj1031999@gmail.com>  
# Contributor: Cedric MATHIEU <me.xenom@gmail.com>
# Contributor: Det <nimetonmaili@gmail.com>
# Contributor: coderoar <coderoar@gmail.com>
# Contributor: Ravicious <ravicious@gmail.com>

pkgname=firefox-nightly-pl
pkgdesc='Standalone web browser from mozilla.org, nightly build, Polish l10n'
pkgver=42.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://nightly.mozilla.org/"
source=("https://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n/firefox-${pkgver}.pl.linux-${CARCH}.tar.bz2" 'firefox-nightly.desktop' 'firefox-nightly-safe.desktop')
sha1sums=('SKIP' 'd998c8a825bb0f58594f822a2e2fbb7c0a1a3ce8' 'd98f7a35fd423a9701dcaef7d4bbffee939198c7')
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite' 'dbus-glib')

package() {
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"

  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/firefox-nightly-icon.png"
}
