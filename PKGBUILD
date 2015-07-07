# Maintainer: Evan Pitstick <nerdx00 at gmail dot com>
# Contributor: Chet Gray <chetgray@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>

pkgname=vcsh
pkgver=1.20150502
pkgrel=1
pkgdesc='manage config files in HOME via fake bare git repositories'
arch=('any')
url='https://github.com/RichiH/vcsh'
license=('GPL')
depends=('git')
optdepends=('myrepos: helps manage a large number of repositories')
source=("https://github.com/RichiH/vcsh/archive/v${pkgver}.zip")
_src_dir="vcsh-${pkgver}"
sha256sums=('4b39f229f6149e46f07a98fc3cb284f4c7e37b99b35f84b2365032e360dcf61f')

prepare() {
  cd "$srcdir/$_src_dir"

  sed -i 's|\(install:\) all|\1|' Makefile
}

package() {
  cd "$srcdir/$_src_dir"

  make DESTDIR="$pkgdir/" ZSHDIR='$(PREFIX)/share/zsh/site-functions' install
}

# vim:set ts=2 sw=2 et:
