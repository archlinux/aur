# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=8.8.8
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
depends=('glibc' 'gtk3' 'alsa-lib' 'desktop-file-utils')
options=('!strip' '!debug' '!zipman' '!emptydirs')
_pkgfile="next-music_${pkgver}_x64.pkg.tar.zst"
source=("${_pkgfile}::https://github.com/Web-Next-Music/Next-Music-Client/releases/download/${pkgver}/${_pkgfile}")
sha256sums=('5b8a2070b3c42a8060f0b690efe3a9530814841ef5cf2135820ef710eb987e9f')
noextract=("${_pkgfile}")

package() {
  bsdtar -xf "${srcdir}/${_pkgfile}" -C "${pkgdir}" \
    --exclude='.PKGINFO' \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE' \
    --exclude='.CHANGELOG' \
    --exclude='.INSTALL'

  mkdir -p "${pkgdir}/usr/bin"
  ln -sf '/opt/Next Music/next-music' "${pkgdir}/usr/bin/next-music"
}
