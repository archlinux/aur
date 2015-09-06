# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=django-bootstrap-form-git
pkgver=1.4.r121.g629d82d
pkgrel=1
pkgdesc="A simple Django template tag to work with Bootstrap"
arch=('any')
url='https://github.com/tzangms/django-bootstrap-form'
license=('BSD')
depends=('python-django')
makedepends=('git')
source=("${pkgname}::git+https://github.com/tzangms/django-bootstrap-form.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
