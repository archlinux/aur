# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=planetary-annihilation-pte
pkgver=latest
pkgrel=3
pkgdesc="Planetary Annihilation Public Test Environment Launcher"
group=("games")
arch=('x86_64')
url="https://forums.uberent.com/threads/streams-pte-and-experimental-builds.58960/page-4#post-937028"
license=('MIT')
depends=("python-pycurl")
conflicts=("planetary-annihilation")
source=("git+ssh://git@github.com/pa-pyrus/papatcher.git"
        "PA.sh")
md5sums=('SKIP'
         'a06eed75eb032d8a03b25d92b8abebd1')

pkgver() {
  cd "$srcdir/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -Dm 755 "$srcdir/papatcher/papatcher.py" "$pkgdir/usr/bin/PA-pte"
  install -Dm 755 "${srcdir}/PA.sh" "${pkgdir}/usr/bin/PA"
}
