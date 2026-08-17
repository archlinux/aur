# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=3.12.1
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
options=('!strip' '!debug' '!zipman' '!emptydirs')
_pkgfile="next-music_3.12.1_x64.pkg.tar.zst"
_pkgtag="v3.12.1"
source=("${_pkgfile}::https://github.com/Web-Next-Music/Next-Music-Client/releases/download/${_pkgtag}/${_pkgfile}")
sha256sums=('7887d05725581eb22f4208fe0eb7440d2364be45d90f003c441177f574d388e0')
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
