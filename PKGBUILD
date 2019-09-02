# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-facebook
pkgver=2018.4.8f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2018.4.8f1.4.8f1.pkg::https://download.unity3d.com/download_unity/9bc9d983d803/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2018.4.8f1.pkg")
md5sums=("a5a6eba3f9c746aa591c224f5fc6fd91")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

