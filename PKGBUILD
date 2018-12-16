# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-facebook
pkgver=2018.3.0f2
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
makedepends=('cpio')
source=("2018.3.0f2.3.0f2.pkg::https://download.unity3d.com/download_unity/6e9a27477296/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2018.3.0f2.pkg")
md5sums=("43869f3c504caa722caab7685fdb6c24")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

