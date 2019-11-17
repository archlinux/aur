# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=1.1.5
pkgrel=1
pkgdesc="Your Debian-based data center in a box"
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python' 'ansible' 'python-future' 'util-linux' 'encfs' 'gnupg')
optdepends=(
  'python-dnspython: required by Ansible "dig" module'
  'python-pyopenssl: required by "openssl_*" Ansible modules'
  'python-netaddr: required by Ansible "ipaddr" filter plugin'
  'python-ldap: required by Ansible "ldap_*" modules'
  'python-passlib: required by Ansible "password" lookup plugin')
makedepends=('python-setuptools')
conflicts=('depops-git')
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz)
sha512sums=('a77d5efcbf777fe1bdcbd5679487bb448f6e4a1ea536f192849f1e613b97e80c562e7b348885ade4b88b0c422148c9bd5cea4ecc0f6bd0d5773094379365c166')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
