# Maintainer: John Trengrove <john@retrofilter.com>
# Contributor: Jean Lucas <jean@4ray.co>

_pkgname=torchtext
pkgname=python-torchtext
pkgver=0.3.1
pkgrel=1
pkgdesc='Data loaders and abstractions for text and NLP'
arch=(any)
url='https://github.com/pytorch/text'
license=(BSD)
depends=(python python-pytorch python-tqdm python-requests)
makedepends=(python-setuptools)
source=("text-${pkgver}.tar.gz::https://github.com/pytorch/text/archive/${pkgver}.tar.gz")
sha512sums=('33c438b0ca3f5d93d524b47d689cffd7920266232ecbdb25e7b386761d7722cc1248a77dccc5deacbc0c76d9126545a7b6dd1291afbb178600b969fe4634d058')

package() {
  cd text-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
