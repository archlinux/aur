# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Andrew Conkling <andrewski@fr.st>

pkgbase=pyrtf
pkgname=(python2-pyrtf)
_realname=PyRTF
pkgver=0.45
pkgrel=2
pkgdesc="A set of Python classes that make it possible to produce RTF documents from Python programs"
arch=('any')
url="http://pyrtf.sourceforge.net/"
license=('GPL')
depends=('python2')
provides=("$pkgbase=$pkgver")
replaces=("$pkgbase")
source=(https://downloads.sourceforge.net/pyrtf/$_realname-$pkgver.tar.gz)
sha256sums=('7c0b7c35688041978786e959fd83dbdffee66ded9d40e1ad0441c460164a349e')

build() {
  cd $_realname-$pkgver
  python2 setup.py build
}

package_python2-pyrtf() {
  cd $_realname-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
