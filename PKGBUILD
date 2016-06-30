# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>

pkgbase=python-jira
pkgname=('python-jira'
  'python2-jira')
pkgdesc="Python library for interacting with JIRA via REST APIs"
pkgver="1.0.7.dev20160607111203"
pkgrel=2
url="https://pypi.python.org/pypi/jira"
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/27/b9/29ec48d8d5c010335cfc9bc492ec601fc3cbbf95e223e8e5cd9994ad9455/jira-${pkgver}.tar.gz"
  'client.patch')
md5sums=('57774afc6133bc3565cee0362e3c7840'
         '65fcf981ccfcd1e7c18922512a828def')

prepare(){
  patch -p1 -i "${srcdir}/client.patch"
}

package_python-jira(){
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

