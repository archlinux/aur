# Maintainer: Yaron de Leeuw < me@jarondl.net >
# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

# Contributor: Shanto <shanto@hotmail.com>

pkgname=python2-apscheduler
_pkgname=APScheduler
pkgver=3.6.0
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
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('8f56b888fdc9dc57dd18d79c124b5093a01e29144be84e3e99130600eea34260')
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
