# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.11
_build=f1
_randomstring=8c6b8ef6d111
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-ios
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
source=("https://download.unity3d.com/download_unity/f2cce2a5991f/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2017.4.10f1.tar.xz")
md5sums=('f763702e199f97670d0dd69d5e97301f')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

