# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: orumin <dev@orum.in>

pkgname=coccigrep-git
pkgver=1.20
pkgrel=1
pkgdesc='Semantic grep for the C language based on coccinelle. Git version'
arch=('any')
url='http://home.regit.org/software/coccigrep/'
license=('GPL3')
depends=('coccinelle')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/regit/coccigrep')
md5sums=('SKIP')
provides=("coccigrep=${pkgver%+*}")
conflict=('coccigrep')

pkgver() {
  git -C coccigrep describe --abbrev=7 --tags | sed 's/^v//; s/-/+/; s/-/./'
}

package() {
  cd coccigrep
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=0
}
