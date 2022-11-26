# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkgname=mumailer
pkgname=python-${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="Simple mailer agent using SMTP"
url="http://www.muflone.com/mumailer"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-yaml')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('fa186fcbaca5198c3ed666886f3ff8766ae043bf604581c03a62956a9b9f4370')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -d "${pkgdir}/usr/share/doc/${pkgname}/samples"
  install -t "${pkgdir}/usr/share/doc/${pkgname}/samples" README.md samples/*
}

