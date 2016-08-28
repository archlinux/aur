# Maintainer of AUR package: Raansu <gero3977@gmail.com>
# Maintainer of splitviewfuse project: seiferma <https://github.com/seiferma>

_pkgname=splitviewfuse
pkgname="$_pkgname"-git
pkgver=v0.2.3.r0.gf690704
pkgrel=1
pkgdesc="A view on a given directory that splits large files into segments implemented as FUSE file system. An additional 
filesystem that merges such segments into regular files is included as well. AUR package by Raansu, project by seiferma"
arch=('any')
url="https://github.com/seiferma/splitviewfuse"
license=('MIT')
depends=('fuse' 'python2-fusepy')
makedepends=('python2' 'python2-setuptools')
provides=('splitviewfuse' 'unionviewfuse')
conflicts=('splitviewfuse' 'unionviewfuse')
source=(git+https://github.com/seiferma/splitviewfuse.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
   cd "$_pkgname" 
   python2 setup.py install --root="$pkgdir/" --optimize=1
}
