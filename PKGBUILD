# Maintainer: Evgeniy Alekseev <arcanis.arch at gmail dot com>
# Contributor: kfgz <kfgz at interia dot pl>
# Contributor: Michael Krauss <hippodriver at gmx dot net>
# Contributor: dsa

pkgname=python-pmw
pkgver=2.0.1
pkgrel=6
pkgdesc="A toolkit for high-level compound widgets in Python using the Tkinter module"
arch=('any')
url="http://pmw.sourceforge.net/"
license=('MIT')
depends=('python' 'tk')
source=(${pkgname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/P/Pmw/Pmw-${pkgver}.tar.gz
        "LICENSE.txt")
md5sums=('8080b0fabc731ff236f97e88e13b3938'
         '28b047a148c1780eddcf4bed6b150123')
changelog="ChangeLog"

build() {
  cd "Pmw-${pkgver}"
  python setup.py build
}

package() {
  cd "Pmw-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
