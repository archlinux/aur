# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=python38-beautifulsoup4
pkgver=4.11.1
pkgrel=1
pkgdesc="A python38 HTML/XML parser designed for quick turnaround projects like screen-scraping"
arch=('any')
url="https://www.crummy.com/software/BeautifulSoup/index.html"
license=('PSF')
depends=('python38-soupsieve')
optdepends=('python38-chardet: to autodetect character encodings'
            'python38-lxml: alternative HTML parser'
            'python38-html5lib: alternative HTML parser')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://pypi.io/packages/source/b/beautifulsoup4/beautifulsoup4-$pkgver.tar.gz")
sha512sums=('7446be07cd55f23def929e6491f0d74a940cf50206ed520b8ae7b9d57bd19ecf6aa821f446ca4f26f1e08b43fcc71fb397886f51a3f0ec691f9e53dfdc7a0cf8')

build() {
  cd beautifulsoup4-$pkgver
  python3.8 setup.py build
}

check() {
  cd beautifulsoup4-$pkgver
  pytest
}

package() {
  cd beautifulsoup4-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
