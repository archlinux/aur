# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=1.8.0
pkgrel=1
pkgdesc="pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.)"
arch=(any)
conflicts=(bugwarrior-git)
url="https://bugwarrior.readthedocs.io"
license=('GPL3')
depends=('python' 'python-setuptools'
         'python-requests' 'python-taskw>=0.8'
         'python-dateutil' 'python-pytz'
         'python-six>=1.9.0' 'python-jinja>=2.7.2'
         'python-dogpile.cache>=0.5.3' 'python-lockfile>=0.9.1'
         'python-click' 'python-future')
optdepends=('python-keyring: keyring support'
            'python-jira>=0.22: jira support'
            'python-pysimplesoap: bts support'
            'python-debianbts>=2.6.1: bts support'
            'python-offtrac: Trac support'
            'python-google-api-python-client: gmail support'
            'python-oauth2client<4.0.0: gmail support'
            'python-phabricator: phabricator support'
            'python-bugzilla: bugzilla support')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ralphbean/bugwarrior/archive/$pkgver.tar.gz")
sha256sums=('df15fd401161dcbdf2d1f6a043a6ab0c93264b43b01ed6d08f39eec213a9c129')

prepare(){
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
