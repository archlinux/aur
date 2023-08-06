# Maintainer: Reto <reto@sligthlybroken.com>
pkgname=limnoria-plugins-progval-github-git
pkgrel=2
pkgdesc="Limnoria plugin that announces GitHub events to IRC."
arch=('any')
pkgver=r1523.6005bc1
url="https://github.com/progval/Supybot-plugins"
license=('BSD')
depends=(python limnoria)
makedepends=(python-setuptools limnoria git)
provides=(limnoria-plugins-progval-github)
source=("git+https://github.com/progval/Supybot-plugins.git")
sha256sums=('SKIP')

pkgver() {
  cd "Supybot-plugins"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/Supybot-plugins/GitHub" || exit 1
	python setup.py build
}

package() {
    cd "$srcdir/Supybot-plugins/GitHub" || exit 1
	python setup.py install --root="$pkgdir" --optimize=1
}
