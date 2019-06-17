# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-windows
pkgver=2019.1.7f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2019.1.7f1.1.7f1.pkg::https://download.unity3d.com/download_unity/f3c4928e5742/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-2019.1.7f1.pkg")
md5sums=("3ebac90257f4b2166907f04fbe21aa06")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

