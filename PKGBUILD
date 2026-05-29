# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=3.8.1
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
options=('!strip' '!debug' '!zipman' '!emptydirs')
_pkgfile="next-music_3.8.1_x64.pkg.tar.zst"
_pkgtag="v3.8.1"
source=("${_pkgfile}::https://github.com/Web-Next-Music/Next-Music-Client/releases/download/${_pkgtag}/${_pkgfile}")
sha256sums=('442cc524398ba9c099ed3893894b781781f36a6f36b9a8f907ac86c9c1b4f6d4')
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
