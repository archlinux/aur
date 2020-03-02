# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Martin Kaffanke <martin@kaffanke.at>
pkgname=b2fuse-git
_reponame="b2_fuse"
pkgver=v1.3.r60.gcba91ab
pkgrel=1
pkgdesc="FUSE integration for Backblaze B2 Cloud storage"
arch=('any')
url="https://github.com/sondree/b2_fuse"
license=('MIT')
groups=('linux-tools')
depends=('python-fusepy' 'python-b2sdk' 'python-pyaml')
makedepends=('git')
source=('git://github.com/sondree/b2_fuse.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_reponame}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

#build() {
#  
 # mkdir -p "${pkgname%-git}/build"
#  cd "${pkgname%-git}/build"
#  python setup.py build
#}


package() {
  cd "$srcdir/${_reponame}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

}
