# $Id$
# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Fernando Jiménez Solano <fjim@sdfeu.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=python2-pyacoustid
pkgver=1.0.0
pkgrel=2
pkgdesc="Bindings for Chromaprint acoustic fingerprinting and the Acoustid API"
arch=('any')
url='https://github.com/sampsyo/pyacoustid'
license=('MIT')
depends=('chromaprint')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/p/${pkgname#*-}/${pkgname#*-}-${pkgver}.tar.gz"
        'https://raw.github.com/sampsyo/beets/master/LICENSE')
sha256sums=('31900428e7b344dca0c2da594b387e88620c319298e3a6400a968078194407d4'
            'ea007e11dca00f67ef7f290d4eaa608b4f2d5b2668a47787d69b6cff348f2fcd')

build() {
  cd ${pkgname#*-}-${pkgver}

  python2 setup.py build
}

package() {
  cd ${pkgname#*-}-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize=1

# License
  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 {../,"${pkgdir}"/usr/share/licenses/${pkgname}/}LICENSE
}

# vim: ts=2 sw=2 et:
