# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Maintainer: Karol Babioch <karol@babioch.de>

pkgname=ansible-container-git
_gitname='ansible-container'
pkgver=r733.gaef6d24
pkgrel=1
pkgdesc="Ansible Container is a tool to build Docker images and orchestrate containers using only Ansible playbooks"
arch=('any')
url="https://github.com/ansible/ansible-container"
license=('GPL')
conflicts=('ansible-container')
provides=('ansible-container')
depends=('python-structlog' 'python-six' 'python-jinja' 'python-ruamel-yaml' 'python-pip' 'python-requests' 'python-yaml' 'python-jsonschema' 'python-docker')
optdepends=('python-docker: building docker containers')
#checkdepends=('ansible' 'python-pytest' 'docker' 'python-jmespath')
source=("$_gitname::git+https://github.com/ansible/$_gitname.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe | sed 's/^release-[[:digit:]]\.[[:digit:]]\.[[:digit:]]-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="${pkgdir}"
}

#check() {
# cd "$srcdir/$_gitname"
# pytest
#}
