 # Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=perl-extract-url
_realname=extracturl
pkgver=1.6
pkgrel=1
pkgdesc="A Perl script that extracts URLs from correctly-encoded MIME email messages"
arch=('any')
url='http://www.memoryhole.net/~kyle/extract_url'
license=('BSD')
depends=('perl>=5.10.0' 'perl-mime-tools' 'perl-html-parser')
optdepends=('perl-curses-ui: curses interface'
            'perl-uri-find: enhanced uri extraction')
replaces=('extract_url')
source=("https://github.com/m3m0ryh0l3/${_realname}/archive/v${pkgver}.tar.gz")
sha256sums=('2f8fb4c361a02ee0053d2e1791d283e9b202297e4b861d7ff676ac00438ddcaf')

build() {
  cd "${_realname}-${pkgver}"
  make
}

package() {
  cd "${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_realname}/LICENSE"
}

