# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=hopcroftkarp
pkgname=python-$_pkgname-git
pkgver=r45.2846e1d
pkgrel=1
pkgdesc="a module to find a maximum matching in bipartite graphs"
arch=('any')
url="https://github.com/sofiatolaosebikan/hopcroftkarp"
license=()
groups=()
depends=(python)
makedepends=(git python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  rm test/__init__.py
  python setup.py install --root="$pkgdir/" --optimize=1
}
