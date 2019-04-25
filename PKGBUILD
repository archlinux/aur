# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-facebook
pkgver=2019.2.0a13
pkgrel=1
pkgdesc="Allows building your Unity projects for the Facebook-Games platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
makedepends=('cpio')
source=("2019.2.0a13.2.0a13.pkg::https://beta.unity3d.com/download/7d71eaf2acca/MacEditorTargetInstaller/UnitySetup-Facebook-Games-Support-for-Editor-2019.2.0a13.pkg")
md5sums=("4028726fea32323b2d2f5cabb992ea1a")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Data/PlaybackEngines/Facebook"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
}

