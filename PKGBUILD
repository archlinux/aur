# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-mac
pkgver=2017.4.31f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Mac platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.31f1.4.31f1.pkg::https://download.unity3d.com/download_unity/9c8dbc3421cb/MacEditorTargetInstaller/UnitySetup-Mac-Support-for-Editor-2017.4.31f1.pkg")
md5sums=("584a1a8fa4a31926f3481f7d7a8b3d92")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/MacStandaloneSupport"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

