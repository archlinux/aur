# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-windows
pkgver=2019.1.0f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("2019.1.0f1.1.0f1.pkg::https://beta.unity3d.com/download/5c52223b18d4/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.1.0f1.pkg")
md5sums=("fda78ea1cdc3bc83eb07b81149212b02")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

