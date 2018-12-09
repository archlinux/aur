# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_version=2018.3.0
_build=f1
_randomstring=f023c421e164
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://beta.unity3d.com/download/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-${_version}${_build}.tar.xz")
sha1sums=('ccf789f95456d0c249c0dc4c6b29246da62b98de')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

