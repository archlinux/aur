# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=1.7.0
pkgrel=1
pkgdesc="pull issues from issue trackers into taskwarrior (GitHub, GitLab, Bitbucket, etc.)"
arch=(any)
conflicts=(bugwarrior-git)
url="https://bugwarrior.readthedocs.io"
license=('GPL3')
depends=('python' 'python-setuptools'
         'python-requests' 'python-taskw'
         'python-dateutil' 'python-pytz'
         'python-six' 'python-jinja'
         'python-dogpile.cache' 'python-lockfile'
         'python-click' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ralphbean/bugwarrior/archive/$pkgver.tar.gz")
sha256sums=('2d7cee5043e35aa1a63d13eeccd14264759ae4358fdd60178bb96eda51b6b487')

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
