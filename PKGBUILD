# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=f1
_randomstring=f023c421e164
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
sha1sums=('a7be55c4e80fdbb613488d564dfc4e820892255d')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

