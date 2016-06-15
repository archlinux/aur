# Maintainer: Dylan Ferris <dylan@psilly.com>

pkgname='visual-sfm'
pkgver=0.5.26
pkgrel=1
pkgdesc='A Visual Structure from Motion System; create 3d models from photos.'
arch=('x86_64')
url='http://ccwu.me/vsfm/'
depends=('gtk2' 'glew' 'devil' 'boost-libs' 'atlas-cpp' 'imagemagick' 'cminpack' 'gcc-fortran' 'metis' 'parmetis' 'freeglut' 'gsl')
optdepends=(
  'opencl-nvidia: nvidia gpu support'
  'opencl-mesa: amd gpu support (mesa)'
  'opencl-catalyst: amd gpu support (catalyst)'
)
license=('custom:visual-sfm')
source=(
  'http://ccwu.me/vsfm/download/VisualSFM_linux_64bit.zip'
  'visual-sfm.desktop'
)
md5sums=(
  '25fcca5e320a9e97131e87abdf3b7f61'
  '52e8eabb314aa7661fd6eb1bee32eaae'
)

build() {
  cd $srcdir/vsfm
  make
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  cd $srcdir/vsfm
  install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
  install -Dm755 bin/VisualSFM "$pkgdir/usr/bin/VisualSFM"
}

# vim:set ts=2 sw=2 et:
