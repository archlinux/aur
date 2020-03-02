# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>
#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Contributor: Dawid Wrobel <cromo@klej.net>
#Contributor: Sébastien Duquette <ekse.0x@gmail.com>
#Contributor: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.4.4
pkgrel=1
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('any')
license=('GPL')
depends=('python-pycurl' 'python-pyparsing' 'python-future')
makedepends=('python-setuptools')
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz")
sha256sums=('1c9ae0e5cefb698e0340242ddba2725344bed24bb5624f190f82c29fa2e65d6b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
