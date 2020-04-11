pkgname=jitsi-meet-prosody-plugins
pkgver=1.0.3992
pkgrel=1
_debrel=1
pkgdesc="Prosody plugins for jitsi-meet"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=('prosody')
options=('!strip')

source=("https://download.jitsi.org/stable/jitsi-meet-prosody_${pkgver}-${_debrel}_all.deb")
sha256sums=('f7f539bec8b5ab00cb401ff4f50c54dda27df9c98012069e6d6c7ab2943ac3ac')

package() {
  cd "${srcdir}"
  tar -xJvf data.tar.xz -C "${pkgdir}"

  rm -r "${pkgdir}/usr/share/doc/jitsi-meet-prosody"
  mv "${pkgdir}/usr/share/jitsi-meet/prosody-plugins" "${pkgdir}/usr/share/jitsi-meet-prosody-plugins"
  rmdir "${pkgdir}/usr/share/jitsi-meet"
  mv "${pkgdir}/usr/share/jitsi-meet-prosody" "${pkgdir}/usr/share/doc/jitsi-meet-prosody-plugins"
  sed -i 's@/usr/share/jitsi-meet/prosody-plugins@/usr/share/jitsi-meet-prosody-plugins@' "${pkgdir}/usr/share/doc/jitsi-meet-prosody-plugins/prosody.cfg.lua-jvb.example"
}

# vim: set ts=2 sw=2 et:
