# Maintainer: Diramix <39developer@diram1x.ru>
pkgname=next-music
pkgver=3.5.0
pkgrel=1
pkgdesc="Web client for Yandex Music with support for themes, addons, Discord Rich Presence (RPC) and OBS widget"
arch=('x86_64')
url="https://github.com/Web-Next-Music/Next-Music-Client"
license=('MIT')
depends=('glibc' 'gtk3' 'alsa-lib' 'desktop-file-utils')
options=('!strip' '!debug' '!zipman' '!emptydirs')
_pkgfile="next-music_3.5.0_x64.pkg.tar.zst"
_pkgtag="v3.5.0"
source=("${_pkgfile}::https://github.com/Web-Next-Music/Next-Music-Client/releases/download/${_pkgtag}/${_pkgfile}")
sha256sums=('7c0179c0f2564d9af473fd38fb8ec3f2079aa40944e49a6435e6c398e919b5b5')
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
