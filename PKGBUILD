# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgname=python2-puppetboard
pkgver=0.0.5
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
sha512sums=('f91c1eec66a13ecc59aaf2eb1d6fb7e102a1b23a2fbb5660f0f59f98f873d6c8c957f162665c6e8d52b65e801e2f6c558536f57c129cb59d8c2ed525d5ea2169')

package() {
  cd "${srcdir}/puppetboard-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
