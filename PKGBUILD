# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.19
_build=f1
_randomstring=06990f28ba00
_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("https://download.unity3d.com/download_unity/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-${_version}${_build}.tar.xz")
sha1sums=('f6e2e23e8865c87e42def0a5a986d52e088842d1')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

