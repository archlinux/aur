# Maintainer: danieltetraquark
# Contributor: Patrick Wozniak <hello@patwoz.de>

pkgname=classifier-git
pkgver=20200206.r129.09e958b
pkgrel=1
pkgdesc="Organize files in your directory instantly, by classifying them into different folders (git-version)"

arch=("any")
license=("MIT")

source=("${pkgname%-git}::git+https://github.com/bhrigu123/classifier.git#branch=master")
depends=("python" "python-arrow")
sha256sums=("SKIP")

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
