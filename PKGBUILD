# Maintainer: moheladwy <mohamed.h.eladwy@gmail.com>
pkgname=ocr4linux-git
pkgver=1.4.2.r54.2b3edc3
pkgrel=1
pkgdesc="OCR CLI Tool for Extracting Text from Screenshots using bash and python for both x11 and wayland."
arch=('any')
url="https://github.com/moheladwy/OCR4Linux"
license=('MIT')
depends=(
  'python'
  'bash'
  'tesseract'
  'gawk'
  'tesseract-data-eng'
  'tesseract-data-ara'
  'python-numpy'
  'python-pillow'
  'python-pytesseract'
  'python-opencv'
  'grimblast-git'
  'wl-clipboard'
  'cliphist'
  'xclip'
  'scrot'
  'rofi'
)
makedepends=('git')
provides=('OCR4Linux')
source=("$pkgname-$pkgver::git+$url")
sha256sums=('SKIP')

pkgver() {
  printf "1.4.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 1

  # Install shell and Python scripts
  install -Dm755 OCR4Linux.py "${pkgdir}/usr/bin/OCR4Linux.py"
  install -Dm755 OCR4Linux.sh "${pkgdir}/usr/bin/OCR4Linux"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install License
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
