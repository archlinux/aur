# Previous Maintainer: Oscar Morante <spacepluk@gmail.com>
# Current Maintaner: Bu Domino <bu.domino@gmail.com>

_prefix=/opt/UnityLts
_hash=518737b1de84

pkgname=unity-editor-lts-windows
pkgver=2019.4.13f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Windows platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("$pkgver.pkg::https://download.unity3d.com/download_unity/${_hash}/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-$pkgver.pkg")
md5sums=('9a171923e818b89eb9f6d36daa5680ad')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}
