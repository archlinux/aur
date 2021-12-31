# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Maintainer: Paul Irofti <paul@irofti.net>
_modulename=scholarly
pkgname=python-$_modulename
pkgver=1.5.1
pkgrel=1
pkgdesc="Retrieve author and publication information from Google Scholar in a friendly, Pythonic way"
arch=(any)
url="https://github.com/OrganicIrradiation/scholarly"
license=('Unlicense')
groups=()
depends=('python-arrow' 'python-beautifulsoup4' 'python-bibtexparser'
	'python-requests' 'python-dotenv' 'python-free_proxy'
	'python-fake-useragent' 'python-selenium' 'python-stem')
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c71da5e8733e497ca16a8e058180e5c4a9b527235ea3c8a39c91c3b5fb56220d')

package() {
  cd "$srcdir/$(tar -tf v${pkgver}.tar.gz | head -n1)"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
}
