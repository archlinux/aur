# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=scholarly
pkgname=python-$_modulename
pkgver=0.2.5
pkgrel=1
pkgdesc="Retrieve author and publication information from Google Scholar in a friendly, Pythonic way"
arch=(any)
url="https://github.com/OrganicIrradiation/scholarly"
license=('Unlicense')
groups=()
depends=('python-arrow' 'python-beautifulsoup4' 'python-bibtexparser' 'python-requests')
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('73669ef708cc82241620af0ed69da4f4af637abbc76820ef78e2cf2e8a70d322')

package() {
  cd "$srcdir/$(tar -tf v${pkgver}.tar.gz | head -n1)"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
