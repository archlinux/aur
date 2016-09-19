pkgname=python2-ceph-cfg-git
_gitname="python-ceph-cfg"
pkgver=4532f4b
pkgrel=1
pkgdesc="Python library to Admin and deploy Ceph"
arch=(any)
url="https://github.com/oms4suse/python-ceph-cfg"
license=('apache')
depends=('python2'
         'parted'
         'gptfdisk'
         'util-linux'
         'ceph')
makedepends=('git' 'python2')
optdepends=()
provides=('python2-ceph-cfg') 
conflicts=('python2-ceph-cfg')
options=(!emptydirs)
md5sums=('SKIP')

source=("${_gitname}::git+https://github.com/oms4suse/python-ceph-cfg.git")

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always | sed 's/-/./g'|sed 's/v//g')
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

}

# vim:set ts=2 sw=2 et:
