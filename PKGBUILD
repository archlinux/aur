# Maintainer: Sauyon Lee <aur@sauyon.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Stunts <f.pinamartins@gmail.com>

pkgname=hangups
pkgver=0.4.13
pkgrel=1
pkgdesc='The first third-party instant messaging client for Google Hangouts'
arch=('any')
url=https://github.com/tdryer/hangups
license=('MIT')
depends=('python-aiohttp' 'python-appdirs' 'python-configargparse'
         'python-mechanicalsoup' 'python-protobuf' 'python-readlike'
         'python-reparser' 'python-requests' 'python-setuptools' 'python-urwid')
source=("https://files.pythonhosted.org/packages/source/h/hangups/hangups-$pkgver.tar.gz")
sha256sums=('f6d9148a9651c618ea91620645eb441b32032b6b19209b1c2db367bbcb30af04')

build() {
  cd hangups-$pkgver
  python setup.py build
}

package() {
  cd hangups-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/hangups LICENSE
}

# vim:set ts=2 sw=2 et:
