# Maintainer: Elias Werberich <elias@werberich.de>

pkgname=amnes
pkgver=20.05.0
pkgrel=1
epoch=0
pkgdesc='Adaptive Meta-Framework for Network Experiment Studies'
url='https://amnes.de'
_repo='https://gitlab.com/amnes/amnes'
arch=(any)
license=(BSD)
makedepends=(git)
depends=('python-peewee>=3.13' 'python-click>=7.0' 'python-yaml>=5.3' 'python-pyro5>=5.8')
source=("git+$_repo#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd amnes
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 THIRDPARTY "$pkgdir/usr/share/licenses/$pkgname/THIRDPARTY"
}

# getver: gitlab.com/amnes/amnes/-/tags
# vim: ts=2 sw=2 et:
