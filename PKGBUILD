# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=sysmontask
pkgver=1.1.1_beta
pkgrel=1
_gitname=SysMonTask
pkgdesc="System monitor with the compactness and usefulness of Windows task manager to allow higher control and monitoring"
arch=('any')
url="https://github.com/KrispyCamel4u/$_gitname"
license=('MIT')
depends=('python' 'python-psutil>=5.8' 'gtk3' 'zenity' 'python-gobject' 'python-xxhash')
makedepends=('tar' 'xz')
conflicts=('sysmontask')
provides=('sysmontask')

source=("${url}/releases/download/v${pkgver}/sysmontask_1.1.1-ubuntu20.10-beta-a_all.deb")
sha256sums=('2546abed806fc0522448e02c7bc5d21c4a6b7ee97078c013673fad5df58a30d7')

package() {
  cd "${pkgdir}"
  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.xz"
  # adjust for arch linux
  mkdir -p usr/lib/python3.9
  mv usr/lib/python3/dist-packages usr/lib/python3.9/site-packages
  rm -r usr/lib/python3
}
 
