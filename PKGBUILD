# Maintainer: Sam Whited <sam@samwhited.com>

pkgname="odoo-module-migrator"
pkgver=0.4.0
pkgrel=1
pkgdesc="Rewrite Odoo modules to upgrade to newer versions of Odoo."
arch=('any')
url='https://github.com/OCA/odoo-module-migrator'
license=('AGPL-3.0-only')
depends=(
    'python'
    'python-argcomplete'
    'python-colorama'
    'python-lxml'
    'python-yaml')
source=("https://github.com/OCA/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9a82afe782b621b16bf4a232ee662ad2a944fd8a597ce7a21d70ab917341ece')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
