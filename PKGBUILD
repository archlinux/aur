# Maintainer: Juri Grabowski <archlinux-aur@jugra.de>
# Python package author: SSH-MITM Dev-Team <support@ssh-mitm.at>
pkgname=python-ssh-mitm
_pkgname=ssh-mitm
pkgver=1.0.0
pkgrel=1
pkgdesc='SSH mitm server for security audits supporting public key authentication, session hijacking and file manipulation.'
arch=('any')
url='https://ssh-mitm.at'
license=('LGPL3')
depends=('python' 'python-paramiko' 'python-pytz' 'python-distutils-extra')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6e/e4/0a2424c1b1be1cfbf738266cecfe3457e76ac8630ee05875f6d3ad55a498/$_pkgname-$pkgver.tar.gz")
sha512sums=('59d388f5c861c076661821c8101be4d6a3465c7bec046af0e0b39668bdecb193c7c8e5829680e810fec0c4d8593d4b8b4b783b2529fc0143446db0131983b29c')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --prefix=/usr -O1 --skip-build
}
