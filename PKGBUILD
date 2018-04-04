# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Brian Douglass <https://github.com/bhdouglass/, http://bhdouglass.com/>

pkgname=clickable
pkgver=171.df08be6
pkgrel=1
_gitname=clickable
pkgdesc='Compile, build, and deploy Ubuntu Touch click packages all from the command line.'
arch=('i686' 'x86_64')
url='https://github.com/bhdouglass/clickable'
license=('GPL3')
depends=('python' 'docker' 'pip2pkgbuild')
optdepends=('android-sdk-platform-tools' 'lxd')
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('git+https://github.com/bhdouglass/clickable.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

mkdir -p $pkgdir/usr/bin
install -m755 -t $pkgdir/usr/bin $srcdir/$pkgname/clickable
}

# vim: ts=2 sw=2 et:
