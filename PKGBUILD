# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=bugwarrior
pkgver=1.5.1
pkgrel=2
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
sha256sums=('f28b98be94e1c11ade5876c68daaa7a6f0a25b3d13c1cf8898da97e411ce63e8')
# source=("$pkgname-$pkgver.tar.gz::https://github.com/ralphbean/bugwarrior/archive/$pkgver.tar.gz")
source=("https://pypi.python.org/packages/fa/68/6121f7b27b641583b7caddfbf509cc9e0c7421e09498c2cf4eeb4d61b6e6/bugwarrior-1.5.1.tar.gz")

prepare(){
    cd "$srcdir/$pkgname-$pkgver"
    sed -i -e 's/!=0.16.0//g' setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
