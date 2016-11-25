# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname='anitya'
pkgver='0.10'
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
sha256sums=('84af0663874d35b04b2b183c5d3524177e139f901bc49003374cb953b2594643')

package() {
  cd "anitya-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
