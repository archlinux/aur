# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

set -u
pkgname='anitya'
pkgver='0.12.0'
pkgrel='1'
pkgdesc="client for Fedora's cross-distribution upstream release monitoring"
arch=('any')
url='https://release-monitoring.org'
license=('GPLv2')
depends=('python2' 'python2-'{sqlalchemy,jinja,openid,flask-openid,flask,wtforms,flask-wtf,docutils,markupsafe,bunch,fedmsg,dateutil,straight.plugin,requests,arrow,kitchen,pyzmq})
# pip is out-of-date
#_github='fedora-infra'
_github='release-monitoring'
_verwatch=("https://github.com/${_github}/${pkgname}/releases.atom" '\s\+<title>\([0-9\.]\+\)</title>.*' 'f')
source=("anitya-${pkgver}.tar.gz::https://github.com/${_github}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5c457faedc7d369deebed427fe978edb568f52554dccad966a4117553238db27')

package() {
  set -u
  cd "anitya-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  set +u
}
set +u
