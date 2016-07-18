# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgname=python2-puppetboard
pkgver=0.1.1
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
sha512sums=('6a2a58ed2ffe991946dc85402faf876b9eb6fddd8238faf0a9dd4277a40b596a962846934bd32a823f5404824616aeff48fc028fed1ab9171d4d31586e418847')

package() {
  cd "${srcdir}/puppetboard-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
