# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=b3
_randomstring=cc0086a8e10c
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("https://beta.unity3d.com/download/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-${_version}${_build}.tar.xz")
sha1sums=('147f7fdae8379f5d4c0b53291232ba2b883384c7')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

