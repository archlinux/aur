# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkgname=mumailer
pkgname=python-${_pkgname}
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple mailer agent using SMTP"
url="http://www.muflone.com/mumailer"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-yaml')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a752b1ad30b1dacdad2adb0cf71084340ea3c62123c7e46cb53ad3937409a01c')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}

