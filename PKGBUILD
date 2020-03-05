# Maintainer: Alexandre Pujol <alexandre@pujol.io>
# Contributor: DebOps project https://debops.org/
# Contributor: Maciej Delmanowski <drybjed@gmail.com>
# Contributor: itsme <mymail@ishere.ru>

pkgname=debops
pkgver=2.0.3
pkgrel=1
pkgdesc="Your Debian-based data center in a box"
arch=('any')
url="https://debops.org/"
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
sha512sums=('bee849a162606efce600b77ac56c754f6b5d9b473d6459f9070c224c78cc7b8b3733125bc1d5318d446d1bed19c0f503a8972f191b1dc2b66e56c61f55a086c8')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
