# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-standardassets
pkgver=2017.4.20f1
pkgrel=1
pkgdesc="Unity Standard Assets for easily getting started building projects in Unity."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.20f1.pkg::https://download.unity3d.com/download_unity/20968fa45e51/MacStandardAssetsInstaller/StandardAssets.pkg")
md5sums=("0e059d2555fd2e08fb5f03942b234bed")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor/Standard Assets"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/StandardAssets.pkg.tmp/Payload" | gzip -dc | cpio -i
}

