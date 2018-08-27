# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Brian Douglass <https://github.com/bhdouglass/, http://bhdouglass.com/>

pkgname=clickable
pkgver=272.c18271a
pkgrel=1
_gitname=clickable
pkgdesc='Compile, build, and deploy Ubuntu Touch click packages all from the command line.'
arch=('i686' 'x86_64')
url='https://github.com/bhdouglass/clickable'
license=('GPL3')
depends=('python' 'docker' 'python-cookiecutter' 'android-tools')
optdepends=('lxd')
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

mkdir -p $pkgdir/usr/bin $pkgdir/usr/lib/python3.7/site-packages/
install -m755 -t $pkgdir/usr/bin/ $srcdir/$pkgname/clickable-dev
mv $pkgdir/usr/bin/clickable-dev $pkgdir/usr/bin/clickable
cp -R $srcdir/$pkgname/clickable $pkgdir/usr/lib/python3.7/site-packages/
}

# vim: ts=2 sw=2 et:
