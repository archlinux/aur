# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>

pkgname=neopo-git
_gitname="neopo"
pkgver=r262.aff8b64
pkgrel=1
pkgdesc="A lightweight solution for local Particle development."
arch=('x86_64' 'aarch64')
url="https://github.com/nrobinson2000/neopo"
license=('custom')
provides=('neopo')
source=('git+https://github.com/nrobinson2000/neopo.git')
md5sums=('SKIP')
makedepends=('python-setuptools')
depends=('python' 'vim' 'git' 'perl-archive-zip' 'libusb')
depends_x86_64=('lib32-glibc')
depends_aarch64=('dfu-util' 'nodejs')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $_gitname
    python setup.py install --root="${pkgdir}/" --optimize=1
}
