# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=2019.2.0b9
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.2.0b9.2.0b9.tar.xz::https://beta.unity3d.com/download/eabe87e2a246/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.2.0b9.tar.xz")
md5sums=("4bb24e9ceebeb80493ed64edefa083ab")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

