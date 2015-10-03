# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=pelican
pkgver=3.6.3
pkgrel=1
pkgdesc="A tool to generate a static blog, with restructured text (or markdown) input files."
arch=('any')
url="http://getpelican.com"
license=('AGPL3')
depends=('python-jinja' 'python-pygments' 'python-feedgenerator' 'python-pytz'
         'python-docutils' 'python-blinker' 'python-unidecode' 'python-six'
         'python-dateutil')
optdepends=('python-markdown: Markdown support'
            'asciidoc: AsciiDoc support'
            'python-beautifulsoup4: importing from wordpress/dotclear/posterous'
            'python-feedparser: importing from feeds'
            'python-rst2pdf: PDF generation'
            'openssh: uploading through SSH'
            'rsync: uploading through rsync+SSH'
            'lftp: uploading through FTP'
            's3cmd: uploading through S3'
            'ghp-import: uploading through gh-pages'
            'python-typogrify: typographical enhancements')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('13b9c41ea3342b7eb0fd7f74078b5a8d5035632f05d8680266f50f4c5626c9c2')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

