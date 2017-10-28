# Maintainer: BasioMeusPuga <disgruntled.mob@gmail.com>

pkgname=twitchy-git
_pkgname=twitchy
pkgdesc="CLI streamlink wrapper for twitch.tv"
pkgver=r186.f791609
pkgrel=1
arch=('any')
url="https://github.com/BasioMeusPuga/twitchy"
license=('GPL3')
provides=('twitchy')
conflicts=('twitchy')
depends=('python' 'streamlink' 'python-requests' 'python-setuptools')
makedepends=('git')
source=("git://github.com/basiomeuspuga/${_pkgname}.git")
md5sums=(SKIP)

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
