# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.16
_build=f1
_randomstring=7f7bdd1ef02b
_prefix=/opt/UnityLts

pkgname=unity-editor-lts-ios
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
source=("https://download.unity3d.com/download_unity/${_randomstring}/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-${pkgver}.tar.xz")
md5sums=('2527aa912c1c9520f77ee8321045f839')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

