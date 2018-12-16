# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-windows
pkgver=2018.3.0f2
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2018.3.0f2.3.0f2.pkg::https://download.unity3d.com/download_unity/6e9a27477296/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2018.3.0f2.pkg")
md5sums=("01c4804576a945a44b1fa53fd4958d85")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

