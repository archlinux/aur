# Maintainer: danieltetraquark
# Contributor: Patrick Wozniak <hello@patwoz.de>

pkgname=classifier-git
pkgver=r129.09e958b
pkgrel=1
url="https://github.com/bhrigu123/classifier"
pkgdesc="Organize files in your directory instantly, by classifying them into different folders (git-version)"
makedepends=('git')
arch=("any")
license=("MIT")

source=("${pkgname%-git}::git+https://github.com/bhrigu123/classifier.git#branch=master")
depends=("python" "python-arrow")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
