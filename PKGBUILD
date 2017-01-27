# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>

pkgbase=python-jira
pkgname=('python-jira'
  'python2-jira')
pkgdesc="Python library for interacting with JIRA via REST APIs"
pkgver="1.0.9"
pkgrel=1
url="https://pypi.python.org/pypi/jira"
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/cc/e8/c037baa32e43685f080e3c33b5a4a057e7fa83ee753e4505ef10278a73e6/jira-${pkgver}.tar.gz"
  'client.patch')
md5sums=('67f3d7cf6892c33f41bf2dcacc777213'
         '47fe5653ef156d7fc8f14b5cb0527197')

prepare(){
  patch -p1 -i "${srcdir}/client.patch"
}

package_python-jira(){
makedepends=('python-requests'
  'python-setuptools')
depends=('python'
  'python-requests'
  'python-six'
  #'python-tlslite'
  'python-requests-toolbelt'
  'python-requests-oauthlib'
  'python-oauthlib')
  cd "${srcdir}/jira-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}


package_python2-jira(){
makedepends=('python2-requests'
  'python2-setuptools')
depends=('python2'
  'python2-requests'
  'python2-six'
  'python2-tlslite'
  'python2-requests-toolbelt'
  'python2-requests-oauthlib'
  'python2-oauthlib')
  cd "${srcdir}/jira-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

