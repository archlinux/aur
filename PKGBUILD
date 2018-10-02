# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.10
_build=f1
_randomstring=674aa5a67ed5
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
sha1sums=('dbc76cdfaf3c2b02582662b37f5bd652cf9a41d0')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

