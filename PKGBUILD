# Maintainer: Luis Arangruen <pizzaman@hotmail.com>
# Contributor: Ryan Gonzalez <rymg19@gmail.com>

pkgname=('mrkd')
pkgver=0.2.0
pkgrel=1
pkgdesc='Write man pages using Markdown, and convert them to Roff or HTML.'
arch=('any')
url='https://github.com/refi64/mrkd'
license=('BSD')
makedepends=('python-setuptools')
depends=('python-pip' 'python-jinja' 'python-mistune1' 'python-plac' 'python-pygments')
source=(https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/${pkgname/-/_}-$pkgver-py3-none-any.whl)
sha256sums=('4cb47bb9eb8933a34ea2f2110529f33a07abcf1da43b7e77328538b7ee6164a0')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
