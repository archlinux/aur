# Maintainer: Dario Giovannetti <dev at dariogiovannetti dot net>

pkgname='wiki-monkey'
# Don't use "-" in pkgver
pkgver='5.2.0'
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
sha256sums=('3a5eecf3a51eba10f51a91132150000020518986d900e51e6a47677287c9ffa5')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
