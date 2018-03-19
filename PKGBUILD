# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Brian Douglass <https://github.com/bhdouglass/, http://bhdouglass.com/>

pkgname=clickable
pkgver=169.6eae4ca
pkgrel=1
_gitname=clickable
pkgdesc='Compile, build, and deploy Ubuntu Touch click packages all from the command line.'
arch=('i686' 'x86_64')
url='https://github.com/bhdouglass/clickable'
license=('GPL3')
depends=('docker' 'python-cookiecutter')
optdepends=()
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

install -dm755 ${pkgdir}/opt  

rm -R ${srcdir}/${pkgname}/.git*
cp -R ${srcdir}/${pkgname} ${pkgdir}/opt/${pkgname}

}

# vim: ts=2 sw=2 et:
