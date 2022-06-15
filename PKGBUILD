# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=python2-mccabe
pkgver=0.6.1
pkgrel=6
pkgdesc="McCabe complexity checker for Python"
arch=('any')
url="https://github.com/flintwork/mccabe"
license=('custom:Expat')
checkdepends=('python2-pytest-runner')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/flintwork/mccabe/archive/$pkgver.tar.gz")
sha512sums=('1da239933f36c8b7c0f9f026822d673d0b207ac49e45027d77500001327964dd66cc7074be22311927176fc313174f4eb7908d0fc45da9fc4623bf1e237293b0')

build() {
  cd "$srcdir"/mccabe-$pkgver
  python2 setup.py build
}

check() {
  cd "$srcdir"/mccabe-$pkgver
  python2 setup.py test
}

package_python2-mccabe() {
  depends=('python2')

  cd mccabe-$pkgver
  python2 setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
