# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2017.4.14
_build=f1
_randomstring=b28150134d55
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
md5sums=('794073ce041df268da6dadbaf5d9a045')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

