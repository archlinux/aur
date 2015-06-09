# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ppa: name=${pkgname}, url=ppa:bhdouglass/indicator-remindor, native

pkgname=indicator-remindor
pkgver=14.06
_ppa_rel=0ubuntu1~trusty
pkgrel=1
pkgdesc="Schedule reminders easily from an indicator"
arch=(any)
url="https://launchpad.net/indicator-remindor"
license=(GPL)
depends=(gstreamer0.10 gtk3 libappindicator3 libnotify python2-dateutil
         python2-dbus python2-feedparser python2-requests remindor-common)
makedepends=(python2-distutils-extra)
optdepends=('yelp: Help stuff')
install=indicator-remindor.install
source=("http://ppa.launchpad.net/bhdouglass/indicator-remindor/ubuntu/pool/main/i/indicator-remindor/indicator-remindor_${pkgver}-${_ppa_rel}.tar.gz")
sha512sums=('6e6cb421d24d51c8ef94a81c65b0ce32f076c6ac379b441b2ff66303507b7bcc3999f08a22c45f01bcfdb986db4bf4a4d58cf76185d468c1e57d63ee61d1b914')

package() {
  cd "${pkgname}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
