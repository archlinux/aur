# Maintainer: Simon Doppler (dopsi) <dop.simon@gmail.com>
pkgname=security-mailer
pkgver=1.0.0
pkgrel=1
pkgdesc='arch-audit digest sender'
conflicts=('security-mailer')
provides=('security-mailer')
arch=('any')
url='https://github.com/dopsi/security-mailer'
license=('GPL3')
depends=('arch-audit' 'python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dopsi/security-mailer/archive/v1.0.0.tar.gz")
sha1sums=('7d72ff1c9a97d88b9731d7e83aa22d5cc53ed902')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir}
    install -d ${pkgdir}/etc/security-mailer
    install -m 644 config.json ${pkgdir}/etc/security-mailer/config.json
}

# vim:ts=4:sw=4:expandtab
