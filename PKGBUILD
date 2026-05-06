# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=3.6.0
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
depends=('glibc' 'gtk3' 'alsa-lib' 'desktop-file-utils')
options=('!strip' '!debug' '!zipman' '!emptydirs')
_pkgfile="next-music_3.6.0_x64.pkg.tar.zst"
_pkgtag="v3.6.0"
source=("${_pkgfile}::https://github.com/Web-Next-Music/Next-Music-Client/releases/download/${_pkgtag}/${_pkgfile}")
sha256sums=('92f5143a7fb896c57aacf9a4254e9267e6a9854443cc2b6fc79e7f6ad03b52c1')
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
