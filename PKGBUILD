# Contributor: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>
# Maintainer: Matthieu Rakotojaona <matthieu.rakotojaona@gmail.com>

pkgname=facedetect-git
pkgver=r32.15cfda5
pkgrel=1
arch=('any')
pkgdesc='a simple face detector for batch processing, used by fgallery'
url='https://www.thregr.org/~wavexx/software/facedetect/'
license=('GPL2')
depends=('opencv' 'python' 'python-numpy')
source=("$pkgname::git+https://github.com/wavexx/facedetect")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}"

  # Binaries
  install -d "${pkgdir}/usr/bin"
  install -m755 "facedetect" "${pkgdir}/usr/bin"
}
