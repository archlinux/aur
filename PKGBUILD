# Maintainer: Nicolas Lorin <androw95220@gmail.com>
# Contributor: Sin Kim <kimsin98@gmail.com>

pkgname=webchanges
pkgver=3.19
pkgrel=0
pkgdesc='Check web content for changes and notify'
arch=('any')
url='https://github.com/mborsetti/webchanges'
license=('MIT' 'BSD')
depends=('python-cssselect'
         'python-html2text'
         'python-lxml'
         'python-markdown2'
         'python-msgpack'
         'python-platformdirs'
         'python-yaml'
         'python-urllib3')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-playwright: option to use browser'
            'python-psutil: option to use browser'
            'google-chrome: option to use browser'
            'python-beautifulsoup4: beautify filter and one of html2text filter methods'
            'python-jsbeautifier: beautify filter'
            'python-cssbeautifier: beautify filter'
            'python-vobject: ical2text filter'
            'python-jq: jq filter'
            'python-pytesseract: ocr filter'
            'python-pillow: ocr filter'
            'python-pdftotext: pdf2text filter'
            'python-deepdiff: deep difference'
            'python-matrix-client-git: matrix reporter'
            'python-pushbullet.py: pushbullet reporter'
            'python-chump: pushover reporter'
            'python-aioxmpp: xmpp reporter'
            'python-redis: redis database'
            'python-keyring: password keyring storage')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('848b0f5834392af95c8523b623b075bc470f5123a1e3ed3b9a947ed611593f62')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
