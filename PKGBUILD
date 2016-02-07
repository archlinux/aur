# Maintainer: Yaron de Leeuw < me@jarondl.net >
# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

# Contributor: Shanto <shanto@hotmail.com>

pkgname=python2-apscheduler
_pkgname=APScheduler
pkgver=3.0.5
pkgrel=1
pkgdesc="In-process task scheduler with Cron-like capabilities"
arch=('any')
url="https://pypi.python.org/pypi/APScheduler"
license=('MIT')
depends=('python2'
         'python2-pytz'
         'python2-tzlocal'
         'python2-futures'
         'python2-funcsigs'
         'python2-six'
         'python2-setuptools'
        )
source=("https://pypi.python.org/packages/source/A/APScheduler/APScheduler-$pkgver.tar.gz"
        "https://bitbucket.org/agronholm/apscheduler/raw/master/LICENSE.txt")
sha256sums=('009dcf552035b30ee967f2677d0d7a49a88f2d36291c42669aa069dd549da9e4'
            '6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758')
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
