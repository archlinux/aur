# Maintainer: Yaron de Leeuw < me@jarondl.net >
# Maintained at : https://github.com/jarondl/aur-pkgbuilds-jarondl

# Contributor: Shanto <shanto@hotmail.com>

pkgname=python2-apscheduler
_pkgname=APScheduler
pkgver=3.6.2
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
sha256sums=('dcbf7ee41d7fc45b2514ad2a25e654e97162bc3af2649f230a5fb66b3f83214b')
package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
