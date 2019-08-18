# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-example
pkgver=2017.4.31f1
pkgrel=1
pkgdesc="Unity Example Project based on Standard Assets."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.31f1.pkg::https://download.unity3d.com/download_unity/9c8dbc3421cb/MacExampleProjectInstaller/Examples.pkg")
md5sums=("e88c4e0b876aa934244af8c9e7dbb40e")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Examples.pkg.tmp/Payload" | gzip -dc | cpio -i
}

