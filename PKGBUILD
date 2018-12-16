# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-ios
pkgver=2019.1.0a12
pkgrel=1
pkgdesc="Allows building your Unity projects for the iOS platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("2019.1.0a12.1.0a12.tar.xz::https://beta.unity3d.com/download/5175bce2e5d4/LinuxEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2019.1.0a12.tar.xz")
md5sums=("a1e4c55627add12e037628a4cc81d8dd")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/PlaybackEngines"
  install -d "${_dest}"
  mv "${srcdir}/Editor/Data/PlaybackEngines/iOSSupport" "${_dest}"
}

