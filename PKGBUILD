# Maintainer: Manu Sánchez (Manu343726) <Manu343726.public@gmail.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=biicode
pkgver=3.4
pkgrel=1
pkgdesc="Simple C/C++ file-based dependency manager"
arch=('i686' 'x86_64' 'armv6h')
url="https://github.com/biicode/biicode/"
license=('MIT')
makedepends=('git')
depends=('cmake' 'zlib' 'glibc' 'sqlite' 'python2-pmw')
options=('!strip')
source=("git+https://github.com/adamnovak/biicode.git#commit=e94d973be22550b45f1ddf7dc3e2da817ebd86e3"
        )
sha256sums=('SKIP')

prepare()
{
  cd biicode
  git submodule update --init --recursive
}

package()
{
  cd biicode
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/biicode
  mv * $pkgdir/opt/biicode
  ln -s $pkgdir/opt/biicode/bii $pkgdir/usr/bin/bii
}
