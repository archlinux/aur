# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Panagiotis Mavrogiorgos (pmav99) <> (gmail)

pkgname=ffmulticonverter-git
pkgver=1.7.0.r6.g97c6ae3
pkgrel=1
pkgdesc="Convert audio, video, image and document files between all popular formats"
arch=(any)
url="https://sites.google.com/site/ffmulticonverter/"
license=('GPL3')
depends=('python-pyqt4')
optdepends=('ffmpeg: for video conversions'
            'imagemagick: for image conversions'
            'unoconv: for document conversions')
makedepends=('git')
conflicts=('ffmulticonverter')
source=("${pkgname}::git+https://github.com/Ilias95/FF-Multi-Converter.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
