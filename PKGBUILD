# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgname=python2-puppetboard
pkgver=0.2.0
pkgrel=1
pkgdesc='Web frontend for PuppetDB which relies on pypuppetdb'
arch=(any)
url='https://github.com/puppet-community/puppetboard'
license=('APACHE')
depends=('python2'
         'python2-flask'
         'python2-flask-wtf'
         'python2-jinja'
         'python2-markupsafe'
         'python2-wtforms'
         'python2-werkzeug'
         'python2-itsdangerous'
         'python2-requests'
         'python2-pypuppetdb')

install=puppetboard.install
source=("https://github.com/puppet-community/puppetboard/archive/v${pkgver}.tar.gz")
sha512sums=('d525bd48a0a0ee6c22f08226026f45684980279ccef386ec1890aa9cb728126bc7fd104d094b56dea85bf14c0b8cafa641f7d2596f25bf99d63fce856966424c')

package() {
  cd "${srcdir}/puppetboard-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
