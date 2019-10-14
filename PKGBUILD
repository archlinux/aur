# Maintainer: Ryan Gonzalez <rymg19@gmail.com>

pkgname=('mrkd')
pkgver=0.1.6
pkgrel=1
pkgdesc='Write man pages using Markdown, and convert them to Roff or HTML.'
arch=('any')
url='https://github.com/refi64/mrkd'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pip' 'python-jinja' 'python-mistune' 'python-plac' 'python-pygments')
source=(https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver-py3-none-any.whl)
sha256sums=('9662b05abbb8e98c2ec5aa60296ca6dd7b39868e5b19f69195dbd1bd22880acb')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
