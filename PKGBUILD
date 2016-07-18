# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>
# Contributor Florian Pritz <bluewind@xinu.at>

pkgname=python2-puppetboard
pkgver=0.1.2
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
sha512sums=('4f2a5519b75a967c58a8f5c2bd3ab63b7b1a4f8e5cb7c33b599d996238034210d55220259d86336f8393616ce891493bb8fb28deab48da603e82cbe3bc00917a')

package() {
  cd "${srcdir}/puppetboard-${pkgver}"
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
