# Maintainer: David Buchanan <d@vidbuchanan.co.uk>
# Contributor: Ave Ozkal <aurpub@ave.zone>
# Contributor: Nikos Fytilis <n-fit@live.com>

_name=fusee-nano
pkgname="$_name-git"
pkgver=0.5.3.2.ge3642e0
pkgrel=1
pkgdesc="A minimalist re-implementation of the Fusée Gelée exploit (git version)"
arch=('any')
url="https://github.com/DavidBuchanan314/fusee-nano"
license=('mit')
makedepends=('git' 'vim')
source=("$_name::git+https://github.com/DavidBuchanan314/fusee-nano")
md5sums=(SKIP)

pkgver() {
  cd $_name
  git describe --long --tags | tr - .
}

build() {
  cd $_name
  make
}

package() {
  cd $_name
  make install "PREFIX=${pkgdir}/usr/bin"
}

