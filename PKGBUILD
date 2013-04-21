# Maintainer: mutantmonkey <aur@mutantmonkey.in>
pkgname=parcimonie-git
_gitname=App-Parcimonie
pkgver=344.437a799
pkgrel=1
pkgdesc="A tool that incrementally refreshes a GnuPG keyring"
arch=('any')
url="https://gaffer.ptitcanardnoir.org/intrigeri/code/parcimonie/"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-any-moose' 'perl-namespace-autoclean'
         'perl-gnupg-interface' 'perl-clone' 'perl-config-general'
         'perl-file-homedir' 'perl-path-class' 'perl-net-dbus'
         'perl-tie-cache' 'perl-time-duration-parse'
         'perl-moosex-types-path-class' 'perl-moosex-getopt')
makedepends=('git')
provides=('parcimonie')
source=('git://gaffer.ptitcanardnoir.org/App-Parcimonie.git#branch=debian')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  perl Build.PL installdirs=vendor destdir="$pkgdir/"
  perl Build
}

package() {
  cd $_gitname
  perl Build install
}

# vim:set ts=2 sw=2 et:
