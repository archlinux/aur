# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=classifier-git
pkgver=20160206.r74.d13d6c2
pkgrel=1
pkgdesc="Organize files in your directory instantly, by classifying them into different folders (git-version)"

arch=('any')
url="https://github.com/bhrigu123/classifier"
license=('MIT')

depends=(
  'python'
)
optdepends=(
)
makedepends=(
)
conflicts=(
)

backup=(
)

source=(
  "${pkgname%-git}::git+${url}.git#branch=master"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
