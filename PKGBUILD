# Maintainer: Paulo Fino (somepaulo)
# Native Arch binaries built on OBS from tagged upstream GitHub releases:
# https://build.opensuse.org/package/show/home:somepaulo:Audacity/audacity-bin
# This is an unofficial community build, not an upstream Audacity binary.

pkgname=audacity-bin
pkgver=4.0.1
pkgrel=2
pkgdesc='Audio editor and recorder (Arch binaries of tagged Audacity GitHub releases, built on OBS)'
arch=('x86_64')
url='https://www.audacityteam.org/'
license=('GPL-3.0-or-later')
groups=('pro-audio')

_obs_pkgrel=2
_obs_url='https://download.opensuse.org/repositories/home:/somepaulo:/Audacity/Arch'
_archive="${pkgname}-${pkgver}-${_obs_pkgrel}-x86_64.pkg.tar.zst"

depends=(
  'alsa-lib'
  'expat'
  'flac'
  'freetype2'
  'glibc'
  'harfbuzz'
  'hicolor-icon-theme'
  'lame'
  'libgcc'
  'libogg'
  'libpng'
  'libsbsms'
  'libsndfile'
  'libsoxr'
  'libstdc++'
  'libvorbis'
  'libx11'
  'lilv'
  'mpg123'
  'opus'
  'opusfile'
  'portaudio'
  'pugixml'
  'qt6-5compat'
  'qt6-base'
  'qt6-declarative'
  'qt6-networkauth'
  'qt6-svg'
  'soundtouch'
  'sqlite'
  'suil'
  'systemd-libs'
  'twolame'
  'wavpack'
  'wxwidgets-common'
  'zix'
  'zlib'
)
provides=("audacity=${pkgver}" 'lv2-host' 'vst3-host')
conflicts=('audacity' 'audacity-git' 'audacity4-bin' 'audacity4-nocloud-git')

options=('!strip' '!debug')
source_x86_64=("${_archive}::${_obs_url}/x86_64/${_archive}")
sha256sums_x86_64=('ad4c047b00a4568ca08835538c7f977a5a3b48e4196cfffba4edb71aeb508262')
noextract=("${_archive}")

package() {
  bsdtar -xpf "$srcdir/$_archive" -C "$pkgdir" \
    --exclude='.PKGINFO' \
    --exclude='.BUILDINFO' \
    --exclude='.MTREE'
}
