# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname='anitya'
pkgver='0.11.0'
pkgrel='1'
pkgdesc="client for Fedora's cross-distribution upstream release monitoring"
arch=('any')
url='https://release-monitoring.org'
license=('GPLv2')
depends=('python2' 'python2-'{sqlalchemy,jinja,openid,flask-openid,flask,wtforms,flask-wtf,docutils,markupsafe,bunch,fedmsg,dateutil,straight.plugin,requests,arrow,kitchen,pyzmq})
# pip is out-of-date
_github='fedora-infra/anitya'
_verwatch=("https://github.com/${_github}/releases.atom" '\s\+<title>\([^<]\+\)</title>' 'f')
source=("anitya-${pkgver}.zip::https://github.com/${_github}/archive/${pkgver}.zip")
sha256sums=('749093beb144436fefdae6bc801099d7f5eb1608c20aadb7440052805dd5a17d')

package() {
  cd "anitya-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
