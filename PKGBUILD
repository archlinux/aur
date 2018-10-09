# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.11
_build=f1
_randomstring=38bd7dec5000
_prefix=/opt/Unity

pkgname=unity-editor-ios
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://download.unity3d.com/download_unity/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-${_version}${_build}.tar.xz")
sha1sums=('98b77d694aae3fc2a7f1d7141d79a43ccaf518a7')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

