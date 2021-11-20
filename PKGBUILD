# Maintainer: Your Name <youremail@domain.com>
pkgname=ttf-bqn386-git
pkgver=r12.0f89cae
pkgrel=2
pkgdesc='An APL and BQN font extending on APL386.'
arch=('any')
url='https://dzaima.github.io/BQN386/'
license=('custom')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/dzaima/BQN386.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 'BQN386.ttf' -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 'index.html' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
