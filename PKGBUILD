# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=pelican
pkgver=3.5.0
pkgrel=1
pkgdesc="A tool to generate a static blog, with restructured text (or markdown) input files."
arch=('any')
url="http://getpelican.com"
license=('AGPL3')
depends=('python-jinja' 'python-pygments' 'python-feedgenerator' 'python-pytz'
         'python-docutils' 'python-blinker' 'python-unidecode' 'python-six'
         'python-dateutil')
optdepends=('python-markdown:       for Markdown support'
            'asciidoc:              for AsciiDoc support'
            'python-beautifulsoup4: for importing from wordpress/dotclear/posterous'
            'python-feedparser:     for importing from feeds'
            'python-rst2pdf:        for PDF generation'
            'openssh:               for uploading through SSH'
            'rsync:                 for uploading through rsync+SSH'
            'lftp:                  for uploading through FTP'
            's3cmd:                 for uploading through S3'
            'ghp-import:            for uploading through gh-pages'
            'python-typogrify:      for typographical enhancements')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('af9a3deafb4683a109a5c44e6d6138aa')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

