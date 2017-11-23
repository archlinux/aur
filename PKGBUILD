# Maintainer: robertfoster
pkgname=repoman-git
pkgver=14829.b46fd5581
pkgrel=1
pkgdesc="Repoman is a Quality Assurance tool for Gentoo ebuilds"
url="http://www.gentoo.org/proj/en/portage/index.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=('python2' 'xmlto' 'rsync' 'portage-git')
source=('portage::git://anongit.gentoo.org/proj/portage.git')
makedepends=('epydoc' 'git' 'docbook-xsl')

build() {
    cd portage/repoman
    python2 setup.py build
} 

package() { 
    cd portage/repoman
    python2 setup.py install --root="$pkgdir" --sbindir=/usr/bin
}

pkgver() {
    cd portage
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
