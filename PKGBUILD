# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=4.2
pkgrel=2
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
license=('MIT')
depends=('python-virtualenv' 'python2-virtualenv' 'python-virtualenv-clone'
         'python-stevedore')
conflicts=('python2-virtualenvwrapper')
replaces=('python2-virtualenvwrapper')
source=(http://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz
        LICENSE)
sha256sums=('cbc7f3587d5c3f23ef4e75fba166c7d4b278dff044d915cb9070845d2a89033e'
            '5c595d48f16a4cd468f08f467b52b6b2e5e43336961176988b7e4f60cf1b651f')

package() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python3 setup.py install --root="$pkgdir" -O1

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
