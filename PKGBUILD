# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgname=python2-puppetboard
pkgver=0.1.0
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
sha512sums=('28a9d97e488651455daa1d5b6dc83a1d067dd0f969485f02b89f3382b39cca7d5ff0e21ab7f6ff7b174afecc893f1771b7c4c4de144b8ac14e415eda4db393ea')

package() {
  cd "${srcdir}/puppetboard-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
