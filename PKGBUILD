# Maintainer of AUR package: Raansu <gero3977@gmail.com>
# Maintainer of acd_cli project: yadayada <https://github.com/yadayada>
_pkgname=acd_cli
pkgname="$_pkgname"-git
pkgver=0.3.2.r0.gaf92960
pkgrel=1
pkgdesc="acd_cli provides a command line interface to 
Amazon Cloud Drive and allows mounting your cloud drive 
using FUSE for read access. It is currently in beta 
stage. AUR package by Raansu, acd_cli project by 
yadayada"
arch=('any')
url="https://github.com/yadayada/acd_cli"
license=('GPL')
depends=('python-appdirs' 'python-requests>=2.1.0' 
'python-sqlalchemy' 'python-dateutil' 
'python-requests-toolbelt' 'python-fusepy' 'python-setuptools' 
'python-colorama')
makedepends=('python')
optdepends=('fuse: Filesystem mount support')
provides=('acd_cli')
conflicts=('acd_cli')
source=(git+https://github.com/yadayada/acd_cli.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
   cd "$_pkgname" 
   python setup.py install --root="$pkgdir/" --optimize=1
}
