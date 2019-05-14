# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-example
pkgver=2017.4.27f1
pkgrel=1
pkgdesc="Unity Example Project based on Standard Assets."
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts')
makedepends=('cpio')
source=("2017.4.27f1.pkg::https://download.unity3d.com/download_unity/0c4b856e4c6e/MacExampleProjectInstaller/Examples.pkg")
md5sums=("e634da2605a7e5659aa990cc0b054ff7")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}/${_prefix}/Editor"
  install -d "${_dest}"
  cd "${_dest}"
  cat "${srcdir}/Examples.pkg.tmp/Payload" | gzip -dc | cpio -i
}

