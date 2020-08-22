# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Devin Christensen <quixoten at gmail dot com>

pkgname=otf-inconsolata-powerline-git
pkgver=r202.e80e3eb
pkgrel=1
pkgdesc='Inconsolata for Powerline'
arch=('any')
url='https://github.com/powerline/fonts'
license=('OFL')
makedepends=('git')
conflicts=("${pkgname%-git}"
           powerline-fonts{,-git})
provides=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname/Inconsolata"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
