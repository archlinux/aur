#Mantainer: M0Rf30
pkgname=portage-git
pkgver=13974.b87f77d
pkgrel=1
pkgdesc="Gentoo's package management system "
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'xmlto' 'rsync' 'eselect-git')
source=('portage::git://anongit.gentoo.org/proj/portage.git')
makedepends=('epydoc' 'git' 'docbook-xsl')
install=$pkgname.install


build() {
  cd portage
  python2 setup.py build 
} 

package() { 
 cd portage
 python2 setup.py install --root="$pkgdir" --sbindir=/usr/bin
}

pkgver() {
  cd portage
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
