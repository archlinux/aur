# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='wiki-monkey'
# Don't use "-" in pkgver
pkgver='5.2.1'
pkgrel=1
pkgdesc="Wiki Monkey - MediaWiki (ArchWiki-optimized) bot and editor-assistant user script (server-enabled version)."
arch=('any')
url="https://github.com/kynikos/wiki-monkey/wiki"
license=('GPL3')
# Keep in sync with setup.py's install_requires option and requirements.txt
depends=('python-configfile'
         'python-xdg'
         'python-flask-restinpeace' # implies 'python-flask-marshmallow', 'python-apispec' and 'python-apispec-webframeworks'
         'python-flask-cors'
         'python-flask-migrate' # implies 'python-flask-sqlalchemy'
         'python-marshmallow-sqlalchemy')
optdepends=('python-pyopenssl: use ad-hoc SSL certificates instead of generating one')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('528dfa75ba17fbff90f14632d7b39e48a5a8f8021ef58712f242f5fd7958c910')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
