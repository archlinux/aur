_pkgname=sailfish-patch
pkgname=$_pkgname-git
pkgver=2.7.0.1.r19.gd79d9a8
pkgrel=1
pkgdesc='helper tool for developing SailfishOS patches'
arch=('any')
url="https://github.com/ichthyosaurus/sailfish-patch"
license=('GPL3')
depends=('git' 'openssh' 'sed' 'xclip' 'rpm'  'rpmextract' 'cpio' 'tar' 'html-xml-utils' 'html2text' 'pngcrush' 'pngquant' 'imagemagick')
makedepends=('git')
provides=("sailfish-patch=$pkgver")
conflicts=("sailfish-patch")
source=("git+https://github.com/ichthyosaurus/sailfish-patch.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --long --tags --exclude release | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/$_pkgname

  install -Dm755 sailfish-patch -t "$pkgdir/usr/bin/"
}
