# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=3.8.0
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
options=('!strip' '!debug' '!zipman' '!emptydirs')
_pkgfile="next-music_3.8.0_x64.pkg.tar.zst"
_pkgtag="v3.8.0"
source=("${_pkgfile}::https://github.com/Web-Next-Music/Next-Music-Client/releases/download/${_pkgtag}/${_pkgfile}")
sha256sums=('6f9b7b1e096fd325941e23739ce9e4447bef66c834a046b0cd8f4d25b8b7ec5d')
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
