# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Duy Truong <jimreynold2nd@yahoo.com>
# Contributor: Vyacheslav Konovalov <vyachkonovalov@protonmail.com>


pkgname='python-jira'
pkgdesc='Python library to work with Jira APIs'
pkgver='3.0'
pkgrel=4
url='https://github.com/pycontribs/jira'
license=('BSD 2-Clause')
arch=('any')
depends=('python-defusedxml'
         'python-keyring'
         'python-requests'
         'python-requests-oauthlib'
         'python-requests-toolbelt')
optdepends=("ipython")
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/pycontribs/jira.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd jira
  python setup.py build
}

package() {
  cd jira
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
